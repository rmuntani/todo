# If you wanted to improve the performance of a web app you were working on, what are some things you would look at / try?

I would check out monitoring and observability tools to help me figure out what the problem could be.
That could include checking if my containers/instances are using all their resources, if there are routes that take too long to answer, and
similar issues. If that is not enough and I'm not able to add the instrumentation that I need to filter out specific problems, I would focus
on common issues. I would focus on the front-end and back-end problems first, as they are likely to be the ones that bring more results.

If none of the solutions work, we'd probably have to do larger changes, like introducing services or components that perform well for 
the current problem, like using a specific DB designed for the problem (e.g. InfluxDB for time-series), or chang

- front-end:
    - ensure package size is as small as possible (e.g. reduce image sizes when possible, remove unnecessary resources);
    - cache expensive calculations when possible (in React, using useMemo; in a similar note, using useCallback);

- back-end:
    - cache expensive calculations when possible;
    - avoid N+1 queries;
    - transform expensive calculations or slow processes (like emails, generating reports, etc) into background calculations 
    (which does reduce the time taken for a request, but doesn't make the slow process faster);
    - optimize queries (by using indexes, reducing amount of data fetched, changing joins, and improving queries according to what is output by performing an EXPLAIN statement); 
    - using pagination/cursors if the data can be split into multiple parts, reducing query time;

- back-end and front-end:
    - make sure algorithms have optimal time-complexity;

- infrastructure:
    - reduce latency by making sure resources are close to end users by using multiple regions and/or CDN for assets;
    - make sure services have teh resources they need (e.g. a given container/instance doesn't have CPU as its bottleneck);
    - scale horizontally (or vertically if needed) the component that doesn't perform well;
