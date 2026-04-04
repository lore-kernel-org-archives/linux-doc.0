Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C81A36F433;
	Sat,  4 Apr 2026 07:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775288079; cv=pass; b=NN5rnPIoxIiZdYRfduWCRX+NBbgS6qo8O2BsWmYipPeQcKAtHPf985YcpkdoFt7grxNpzzkY7XS34ec7w0Ge+tNWAdhiNIVf/OSE7Rld7HN0cBCWSJDUvswpAjvDaO04LIIoLQqmMhhmS5/n2xtaqcYRrO3DZ3TIi8v4b6peyC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775288079; c=relaxed/simple;
	bh=Hmq6ZUX6PpD7zZr0Y+kcM6prXYW4zNJS5WbPthpCBFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TsDMvczHLtgJfvm6RVQrXdQkPG62JOoq8SiJTyl6GCYxPfUfYBaUSnzjwkIwfBAj7/U7JJBT6fdIjNRiKmM8NVyHBbA3ntRkhNlvFN3JZUApbWPw7Hx/FUeiSB5IWEWKXTJXvF83OKsJfE/7V9rD6e3PSrytItdWZjhbFt03h3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=QuXW1kbw; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="QuXW1kbw"
ARC-Seal: i=1; a=rsa-sha256; t=1775288069; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eeSQCivQRY+suA9Lh93qM9zVmLxMZWbtgFaBzU3965LnSqmo3o6HGPwuyd4jKWXWqjCPqcGBBZb2Kl1ey/LUohDINt6q01kSwrJA2kZ0KVwCl3iB9xTtZBC1KOGR9yEYg0wu6N4lDNSoqxJqmeTZDVfguwCGevrke4MEOY2Ov7E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775288069; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ysyV44u4lFwhF5OlkZ42b1zazG2h2GfWsuRAX45ZuL4=; 
	b=InkbiV5G7oU/6YGiB8Nix2WhxYregcg8eBHjIlNwTmpH9njo5AIy8+PQXMkoDf2tvFtHhMwVqwmml29pYlJGP75Xfye8AmFk/lDQfePh8173tt4pNHWh/CYh/CBP9VGWCLLB/4+3KyfUh6Iupt98pCwI0IQaY33crhY2mfKmPgY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775288069;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ysyV44u4lFwhF5OlkZ42b1zazG2h2GfWsuRAX45ZuL4=;
	b=QuXW1kbwN75VXuUROf+yb7k2cksCET4k6GjZ1fnj7OIlGZVxIy3nCQ/huo0IhHyZ
	nsvHK0GvVpbo9F9uVV8RPxVDUVws/j3o68u8+diM0MsWAeHROteGjvnOqz+K3Aew8OF
	G9blB1Dr7l58ASAo/3vY58A/J+ebzUqtffrxbf+4=
Received: by mx.zohomail.com with SMTPS id 1775288060399560.4685099152398;
	Sat, 4 Apr 2026 00:34:20 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v3 1/2] docs: add advanced search for kernel documentation
Date: Sat,  4 Apr 2026 03:34:12 -0400
Message-ID: <20260404073413.32309-2-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260404073413.32309-1-rito@ritovision.com>
References: <20260321181511.11706-1-rito@ritovision.com>
 <20260404073413.32309-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Replace the stock search page with a kernel-specific search UI
that still builds on Sphinx-generated search data.

Results are grouped into Symbols, Sections, Index entries, and
Pages. The advanced panel adds filters for documentation area,
object type, result kind, and exact identifier matching while
preserving shareable URL state. Result kinds are presented as tabs
so broad searches can switch between them without scrolling through
large sections.

Page summaries are fetched only for the Pages result kind. The
default view limits summaries to the first 50 page results while
allowing a per-session opt-out for deeper summary loading. Summary
loading is deferred to the active Pages view, and stale work is
canceled when the query or active result kind changes.

The sidebar search template is replaced with a matching quick-search
entry point that links to the advanced search page.

The runtime includes compatibility handling for the supported Sphinx
range, including older search-index layouts and pre-9.x stopword
APIs. On Sphinx 3.4.3 through 5.1.x, advanced search degrades
gracefully to Symbols and Pages because those versions do not emit
the section and index metadata available in 5.2.0 and newer.

A lightweight build-time smoke test is included for the generated
search page, copied runtime asset, and search-index contract.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
Assisted-by: Claude:Opus-4.6
---
Summary
=======

This feature adds an Advanced Search interface for kernel
documentation. It is intended to provide a more capable complement to
regex and grep than the existing Quick Search interface, while still
building on the same underlying Sphinx search primitives.

It organizes results into Symbols, Sections, Index entries, and Pages,
while also exposing filters and more targeted identifier search.

The implementation stays close to the existing Sphinx search model. It
reuses existing Sphinx-generated search artifacts and adds a client-side
interface around them, rather than introducing a separate indexing
pipeline, non-Sphinx search backend, or additional build-time
infrastructure.

It is intended to remain broadly compatible with supported Sphinx
builds and to work with both in-tree and out-of-tree documentation
builds.

It also changes the runtime cost shape of documentation search. In the
default view, advanced search renders grouped results without triggering
page-summary fetches, and in limited Pages mode it loads only the
rendered page summaries, up to 50. On broader queries, that
substantially reduces request volume and transferred bytes compared with
the stock Quick Search page.


Problem and Purpose
===================
The need for this feature can be understood through this context
sequence:

1. Kernel contributors and documentation readers need to navigate a
   very large body of material spread across many subsystems, APIs,
   generated reference pages, and long-form documents, often without
   already knowing which page contains the thing they need.

2. Regex and grep are powerful for precise text hunting in a local
   source tree, but they are not ideal for finding the right rendered
   documentation page, section, or symbol when the user does not
   already know where to look.

3. The existing quick search provides a useful lightweight entry point,
   but it does not expose richer filtering, result grouping, or more
   targeted identifier search workflows. On broader queries, it also
   scales page-summary loading work with result breadth, which makes
   the experience both noisier and more resource-intensive than it
   needs to be.

4. Maintenance of complex front-end systems is a higher barrier in this
   environment because there are fewer contributors focused on front-end
   implementation details. For that reason, safer solutions should stay
   within the existing documentation infrastructure rather than
   introducing additional dependencies or separate supporting systems.

Taken together, these constraints favor a solution that improves
navigation within rendered documentation while remaining within the
existing documentation infrastructure and search model.


Design Goals
============

- Expose more structured search workflows than Quick Search.
- Keep the implementation aligned with established documentation
  architecture to limit maintenance and onboarding overhead.
- Remain easy to disable or roll back if needed.
- Allow for future filter adjustment or expansion without restructuring
  the system.
- Use standard HTML form semantics rather than custom widget frameworks.
- Keyboard navigation and standard accessible form semantics with no
  custom focus management.
- Maintain broad Sphinx version compatibility.
- Work with both in-tree and out-of-tree documentation builds.

Anti-goals
==========

- Replacing regex or grep.
- Introducing a separate search backend.
- Adding new build-time dependencies.
- Altering build-time processes
- Adding low-value bells and whistles that increase complexity.
- Redesigning the theme.
- Redesigning the sidebar search.


Design & Implementation
=======================

Architecture Overview
---------------------

This feature is implemented by extending the Sphinx documentation setup
already used by the kernel tree, rather than by introducing a separate
search backend or indexing pipeline.

Sphinx already provides several useful extension points for this kind of
feature. It allows template overrides through the configured template
path, static asset overrides through the configured static path, and it
generates search artifacts such as `searchindex.js` and
`language_data.js` as part of the normal documentation build.

Those existing hooks define the basic boundaries of the implementation.
The feature can replace or extend the rendered search UI, add client-side
behavior, and reuse Sphinx-generated search data, but it does not create
its own independent search index or separate documentation build system.

Baseline Search Structure
-------------------------

The default Sphinx setup already provides a basic quick-search entry
point and the generated search artifacts needed for client-side
searching.

In the kernel documentation build, this means the existing setup already
exposes:

* a sidebar quick-search box
* a generated `searchindex.js` file
* generated `language_data.js` search-language support
* the stock Sphinx search page and initialization model

What it does not provide is a richer search workflow tailored to kernel
documentation navigation. In particular, the default flow does not
provide grouped results, richer filtering, or a dedicated search
interface for navigating symbols, sections, index entries, and pages as
distinct result kinds.

Template Integration
--------------------

The feature is integrated through two Sphinx template overrides:

* `Documentation/sphinx/templates/searchbox.html`
* `Documentation/sphinx/templates/search.html`

`searchbox.html` serves as the sidebar entry point. It is effectively a
close copy of the theme's default quick-search component, but adds a
dedicated link to `search.html?advanced=1` so the full search page opens
with the advanced filters enabled.

`search.html` provides the full Advanced Search page. It defines the
search query field, the advanced filter controls, and the results
container that is later populated by
`Documentation/sphinx-static/kernel-search.js`.

The feature is also trivial to rollback. Because the integration is
implemented as template overrides, rollback only requires deleting
`searchbox.html` and `search.html`. That restores the original default
Sphinx theme templates (including Quick Search) without untangling
architecture, altering configuration, or reverting history.

User Interface and Styling
--------------------------

The user-facing interface is defined in `search.html` and styled in
`Documentation/sphinx-static/custom.css`.

The markup in `search.html` is a shared contract with
`kernel-search.js` and `custom.css`. The JavaScript runtime depends on
specific form IDs and result container IDs, while the CSS depends on the
corresponding classes. Changes to the template markup therefore need to
be made with both files in mind.

At a high level, the page provides:

* a search query field
* a submit action and progress/status area
* a collapsible advanced-filter panel
* result-kind filters
* documentation-area and object-type filters
* a runtime-rendered tabbed results interface
* a Pages summary-loading mode toggle

That runtime-rendered results interface is built by
`kernel-search.js`. It renders result tabs for Symbols, Sections, Index
entries, and Pages, along with per-kind result panels. The Pages tab
includes its own summary-loading mode control so the user can switch
between the normal limited mode and a broader unbounded mode directly
within that view when needed.

The CSS in `custom.css` is responsible for the layout and responsive
presentation of the search interface. In particular, it supports the
tabbed results UI and keeps the result tabs sticky so users can switch
between result kinds at any time while searching, even when the result
lists are long.

The templates use standard accessible form semantics, including labeled
controls, grouped filter fields, and a collapsible advanced-filter
panel.

JavaScript Runtime Flow
-----------------------

The client-side runtime is implemented in
`Documentation/sphinx-static/kernel-search.js`.

At a high level, the flow is:

1. `search.html` includes `_static/language_data.js`,
   `kernel-search.js`, and the generated `searchindex.js`.

2. `kernel-search.js` waits for `searchindex.js` to populate the shared
   `Search` index.

3. The runtime reads query state from the page and URL parameters.

4. The query is normalized and prepared for matching.

5. The runtime searches across Sphinx-generated index structures and
   collects matches as distinct result kinds: Symbols, Sections, Index
   entries, and Pages.

6. The collected matches are scored, grouped, filtered, and rendered
   into the results container in `search.html`.

7. For page results, summaries may be fetched lazily from generated HTML
   pages after the initial result set is rendered.

Page Summaries and Runtime Cost
-------------------------------

The most important runtime distinction from the stock search page is how
page summaries are loaded.

In the default advanced-search view, grouped results are rendered
without triggering page-summary fetches. Page summaries are fetched only
when the user switches to the Pages tab.

In that Pages view, the normal mode is intentionally limited. It loads
only the rendered page summaries, up to a maximum of 50. For smaller
queries, that means loading all rendered page summaries when fewer than
50 exist. For broader queries, that keeps page-summary work bounded
instead of scaling with the full result set.

This means the feature does not remove the shared Sphinx startup and
search-index load cost. The main runtime change happens after initial
results are available: the advanced interface reduces the amount of
follow-on summary-loading work, especially for broader queries.

Extensibility
-------------

The current structure is intended to support incremental changes within
the existing search model.

In practice, that means it is straightforward to:

- add or adjust filters in ``search.html``
- add corresponding styling in ``custom.css``
- extend query handling and result collection in ``kernel-search.js``
- tune ranking and grouping behavior within the existing client-side
  runtime

This makes the feature reasonably extensible for incremental search UI
and result-model improvements, while still keeping the implementation
contained within the existing Sphinx template and static-asset model.

Sphinx Version Compatibility
----------------------------

Sphinx version compatibility is handled in `kernel-search.js` by
accounting for the meaningful differences in generated search data
across supported versions.

The main compatibility differences are:

* stopword representation
* object index layout
* availability of section and index-entry metadata

Sphinx 3.4.3 through 8.2.3 expose stopwords in a form that behaves like
an array. Sphinx 9.1.0 exposes stopwords in a form that behaves like a
set. The runtime includes compatibility handling for both
representations.

The generated object index also differs across versions. Sphinx 3.4.3
uses a name-to-tuple mapping for object entries, while Sphinx 4.0 and
newer use an array-based layout. The runtime supports both forms when
collecting Symbol results.

The most visible functional difference is that Sphinx 3.4.3 through
5.1.x do not emit the `alltitles` and `indexentries` metadata used to
populate Sections and Index entries. Because of that, that range
provides partial support: Symbols and Pages still work, but expect
fewer total results because Sections and Index entries are unavailable.

Sphinx 5.2.x and newer provide full support.


Compatibility
=============

This feature works with both in-tree and out-of-tree documentation
builds.

The interface requires JavaScript at runtime.

Sphinx 5.2 and newer provide full support.

Sphinx 3.4.3 through 5.1.x provide partial support. In that range, the
feature remains usable, but older Sphinx builds do not emit the
metadata needed for Sections and Index entries. As a result, expect
fewer total results, with only Symbols and Pages available.

This behavior was directly validated on:

- Sphinx 9.1.0
- Sphinx 8.2.3
- Sphinx 3.4.3 on Python 3.9

For example, searching for `futex` under full support returns 280
results. On Sphinx 3.4.3, the same search returns 223 results: 200
Symbols and 23 Pages, with no Sections or Index entries.

This runtime behavior was benchmarked on Sphinx 9.1.0 against stock
Quick Search using the queries `kernel`, `futex`, and `landlock`.
Across that set, advanced search kept the default path flat at zero
page-summary requests and 12 total requests, while stock summary work
grew with query breadth. In limited Pages mode, advanced search loaded
10 page summaries for `landlock`, 23 for `futex`, and 50 for `kernel`.


Trade-offs
==========

This feature accepts some additional template, CSS, and JavaScript
complexity in exchange for a more structured and useful search workflow
than the existing Quick Search interface can provide.

At the same time, it avoids a much larger architectural jump. Rather
than introducing a separate indexing pipeline, non-Sphinx backend, or
additional build-time infrastructure, it stays within the existing
Sphinx search model and reuses Sphinx-generated search artifacts.

That design keeps the feature more contained, easier to integrate, and
trivial to rollback, but it also means the feature remains bounded by
the data that Sphinx already emits.

One explicit compatibility trade-off is that Sphinx 3.4.3 through 5.1.x
provide only partial support. Supporting those versions fully would
require additional compatibility logic for metadata they do not emit.
Instead, the feature accepts degraded results in that range while
keeping full support on newer Sphinx versions.

This is not a universal first-summary latency win. On broad queries such
as `kernel`, the stock search page can reach a first resolved summary
sooner, but it does so by issuing far more requests and transferring far
more data. The performance advantage of advanced search is that it
reduces summary-loading work and keeps that work bounded as query
breadth increases.

So the overall trade-off shape is:

- more capability than Quick Search, but more complexity to maintain
- less complexity than a separate search architecture, and lower
  maintenance and learning overhead because it stays within the
  existing Sphinx infrastructure.
- broad support across Sphinx versions, but not uniform support on
  earlier versions to avoid greater maintenance complexity.
- another subsystem to maintain, but trivial to rollback if needed.


Maintenance and Risk Considerations
===================================

The main maintenance burden comes from the fact that this feature is a
coordinated template/CSS/JavaScript unit rather than a single isolated
change. `search.html`, `searchbox.html`, `custom.css`, and
`kernel-search.js` depend on a shared contract of markup structure, IDs,
and classes. Changes in one of those files may require corresponding
changes in the others.

A second maintenance risk is Sphinx-version drift. The feature relies on
Sphinx-generated search data and therefore depends on the structure and
availability of that data remaining compatible enough for the runtime to
interpret it correctly. The main known variation points are stopword
representation, object index layout, and metadata availability for
Sections and Index entries. Future Sphinx releases may require renewed
validation or additional compatibility handling.

The feature also depends on generated HTML structure when deriving page
summaries. If the relevant page markup changes, summary extraction may
degrade even if the underlying search index still works correctly. That
makes summary behavior one of the more fragile parts of the runtime.

Theme and layout changes are another practical risk. The feature is
integrated through kernel-local template overrides and styling, so
changes to surrounding layout expectations may require corresponding
adjustments to searchbox integration, page structure, or responsive
presentation.

These risks are mitigated by keeping the feature within the existing
Sphinx extension points, avoiding new build-time dependencies or a
separate search backend, validating behavior across supported Sphinx
versions with the smoke test in `tools/docs/test_advanced_search.py`
and the developer-side benchmark harness in
`tools/docs/bench_search_playwright.mjs`, and keeping rollback simple
through removal of the template overrides and static assets. The
benchmark harness is a developer tool for validation and comparison,
not a dependency of the documentation build itself.

v3:
- Reworked the results UI from collapsible groups to a tabbed interface.
- Added sticky result tabs so result-kind switching remains available
  while browsing long result lists.
- Added a Pages summary-loading mode control to the Pages view.
- Hardened Pages summary loading so it starts only when the Pages view
  is opened, reuses fetched page text within the page session, applies
  bounded concurrent loading, and supports a limited mode that caps
  rendered page summaries at 50.
- Clarified and expanded Sphinx compatibility handling, including
  graceful degraded behavior on older builds.
- Added a build-time smoke test for advanced-search assets and search
  page wiring.
- Added integration, compatibility, testing, and rollback
  documentation.
- Added a MAINTAINERS entry for the main feature file.

 Documentation/doc-guide/sphinx.rst            |   71 +
 Documentation/sphinx-static/custom.css        |  288 ++++
 Documentation/sphinx-static/kernel-search.js  | 1182 +++++++++++++++++
 Documentation/sphinx/templates/search.html    |  117 ++
 Documentation/sphinx/templates/searchbox.html |   30 +
 MAINTAINERS                                   |   10 +
 tools/docs/test_advanced_search.py            |  312 +++++
 7 files changed, 2010 insertions(+)
 create mode 100644 Documentation/sphinx-static/kernel-search.js
 create mode 100644 Documentation/sphinx/templates/search.html
 create mode 100644 Documentation/sphinx/templates/searchbox.html
 create mode 100755 tools/docs/test_advanced_search.py

diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-guide/sphinx.rst
index 51c370260..6f71192eb 100644
--- a/Documentation/doc-guide/sphinx.rst
+++ b/Documentation/doc-guide/sphinx.rst
@@ -194,6 +194,77 @@ subdirectories you can specify.
 
 To remove the generated documentation, run ``make cleandocs``.
 
+Advanced Search Integration
+---------------------------
+
+The advanced search integration is a kernel-specific Sphinx
+customization that overrides the stock search page and sidebar
+quick-search template to provide a more capable search interface for
+kernel documentation while still building on the same underlying
+Sphinx search primitives.
+
+The advanced search integration is implemented by three files:
+
+* ``Documentation/sphinx/templates/search.html`` for the custom search page;
+* ``Documentation/sphinx/templates/searchbox.html`` for the sidebar link;
+* ``Documentation/sphinx-static/kernel-search.js`` for the client-side
+  search runtime.
+
+The page relies on a strict boot order. ``language_data.js`` must load
+before ``kernel-search.js``, and ``searchindex.js`` must load afterwards
+to populate the shared search index consumed by the runtime.
+
+The runtime works with all supported Sphinx versions, but the available
+result kinds differ by the metadata present in ``searchindex.js``:
+
+* Sphinx ``3.4.3`` through ``5.1.x`` provide ``Symbols`` and ``Pages``.
+  ``Sections`` and ``Index entries`` are unavailable because those
+  versions do not emit the ``alltitles`` and ``indexentries`` fields.
+* Sphinx ``5.2.0`` and newer provide the full result set: ``Symbols``,
+  ``Sections``, ``Index entries``, and ``Pages``.
+
+Runtime behavior is intentionally bounded, but still fully client-side:
+
+* ``searchindex.js`` is loaded into the browser before any query can run,
+  and broad full-site builds can still increase page-load and query latency.
+* The ``Pages`` group starts collapsed. Page-summary fetches begin only
+  after the user opens that group.
+* Page summaries are fetched on demand after the user opens the
+  ``Pages`` group. Browsers with ``IntersectionObserver`` keep that work
+  near the viewport, with at most four concurrent requests, an
+  eight-second timeout, and a limit of fifty summarized page results per
+  query.
+* Successful summary fetches are cached for the current page session.
+  Aborted or failed fetches are not cached, and the result remains usable
+  as a normal link even when its summary is unavailable.
+
+If full-site ``searchindex.js`` size becomes the bottleneck, that needs a
+larger follow-up design such as precomputed summary sidecars, sharded
+search data, or a server-backed search service. The client-side runtime
+described here does not solve that class of scaling limit.
+
+For a quick local regression check, run::
+
+	python3 tools/docs/test_advanced_search.py
+
+It builds a small documentation subset and verifies the generated search
+page, copied static assets, and the search index contract used by the
+client-side search runtime.
+
+To verify full-site support for a change, also run at least one full
+``make htmldocs`` build and manually exercise the generated ``search.html``
+page.
+
+To disable the feature and return to the theme's default Quick Search setup,
+remove the two template overrides:
+
+* ``Documentation/sphinx/templates/search.html``
+* ``Documentation/sphinx/templates/searchbox.html``
+
+That restores the native Sphinx search page and the default sidebar quick
+search box. ``kernel-search.js`` can then be removed as follow-up cleanup,
+but removing the two template overrides is enough to roll back behavior.
+
 .. [#ink] Having ``inkscape(1)`` from Inkscape (https://inkscape.org)
 	  as well would improve the quality of images embedded in PDF
 	  documents, especially for kernel releases 5.18 and later.
diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index db24f4344..a0c81d811 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -169,3 +169,291 @@ a.manpage {
 	font-weight: bold;
 	font-family: "Courier New", Courier, monospace;
 }
+
+/* Keep the quick search box as-is and add a secondary advanced search link. */
+div.sphinxsidebar p.search-advanced-link {
+    margin: 0.5em 0 0 0;
+    font-size: 0.95em;
+}
+
+/*
+ * The enhanced search page keeps the stock GET workflow but adds
+ * filter controls and grouped results.
+ */
+form.kernel-search-form {
+    margin-bottom: 2em;
+}
+
+/* Search bar layout: query input and submit action row. */
+div.kernel-search-query-row {
+    display: flex;
+    flex-wrap: wrap;
+    gap: 1em;
+    align-items: end;
+}
+
+div.kernel-search-query-field {
+    flex: 1 1 26em;
+}
+
+div.kernel-search-query-field label,
+div.kernel-search-field label,
+fieldset.kernel-search-kind-filters legend {
+    display: block;
+    font-weight: bold;
+    margin-bottom: 0.35em;
+}
+
+div.kernel-search-query-field input[type="text"],
+div.kernel-search-field select {
+    width: 100%;
+    box-sizing: border-box;
+}
+
+div.kernel-search-query-actions {
+    display: flex;
+    align-items: center;
+    gap: 0.75em;
+}
+
+span.kernel-search-progress {
+    min-height: 1.2em;
+    color: #666;
+}
+
+/* Collapsible advanced-filter panel. */
+details.kernel-search-advanced {
+    margin-top: 1em;
+    padding: 0.75em 1em 1em 1em;
+    border: 1px solid #cccccc;
+    background: #f7f7f7;
+}
+
+details.kernel-search-advanced summary {
+    cursor: pointer;
+    font-weight: bold;
+}
+
+/* Responsive grid for advanced search filters. */
+div.kernel-search-advanced-grid {
+    display: grid;
+    grid-template-columns: repeat(auto-fit, minmax(16em, 1fr));
+    gap: 1em 1.25em;
+    margin-top: 1em;
+}
+
+fieldset.kernel-search-kind-filters {
+    margin: 0;
+    padding: 0;
+    border: none;
+}
+
+label.kernel-search-checkbox {
+    display: flex;
+    align-items: flex-start;
+    gap: 0.5em;
+    margin-bottom: 0.35em;
+}
+
+/* Tabbed result shell, cards, and lazy-loaded page summaries. */
+div.kernel-search-results {
+    margin-top: 1.5em;
+}
+
+p.kernel-search-status {
+    margin-bottom: 1.5em;
+}
+
+div.kernel-search-results-shell {
+    display: flex;
+    flex-direction: column;
+    max-height: min(78vh, 56rem);
+    border: 1px solid #d8d8d8;
+    border-radius: 0.75rem;
+    background: #fbfbfb;
+    overflow: hidden;
+}
+
+div.kernel-search-tab-strip {
+    position: relative;
+    flex: 0 0 auto;
+    border-bottom: 1px solid #dddddd;
+    background: #ffffff;
+}
+
+div.kernel-search-tab-strip::before,
+div.kernel-search-tab-strip::after {
+    content: "";
+    position: absolute;
+    top: 0;
+    bottom: 0;
+    width: 1.25rem;
+    opacity: 0;
+    pointer-events: none;
+    transition: opacity 120ms ease-in-out;
+    z-index: 2;
+}
+
+div.kernel-search-tab-strip::before {
+    left: 0;
+    background: linear-gradient(90deg, rgba(0, 0, 0, 0.18), rgba(0, 0, 0, 0));
+}
+
+div.kernel-search-tab-strip::after {
+    right: 0;
+    background: linear-gradient(270deg, rgba(0, 0, 0, 0.18), rgba(0, 0, 0, 0));
+}
+
+div.kernel-search-tab-strip.has-left-shadow::before,
+div.kernel-search-tab-strip.has-right-shadow::after {
+    opacity: 1;
+}
+
+div.kernel-search-tab-scroller {
+    display: flex;
+    gap: 0.45rem;
+    overflow-x: auto;
+    -webkit-overflow-scrolling: touch;
+    padding: 0.85rem 1rem 0;
+    scrollbar-width: thin;
+}
+
+div.kernel-search-panel-tools {
+    flex: 0 0 auto;
+    padding: 0.8rem 1rem 0.6rem;
+    border-bottom: 1px solid #e6e6e6;
+    background: #fbfbfb;
+}
+
+label.kernel-search-summary-limit {
+    margin-bottom: 0;
+}
+
+button.kernel-search-tab {
+    appearance: none;
+    border: 1px solid transparent;
+    border-bottom: none;
+    border-radius: 0.6rem 0.6rem 0 0;
+    background: transparent;
+    color: #444444;
+    cursor: pointer;
+    display: inline-flex;
+    align-items: baseline;
+    gap: 0.45rem;
+    margin: 0;
+    padding: 0.7rem 0.95rem 0.65rem;
+    white-space: nowrap;
+}
+
+button.kernel-search-tab:hover {
+    background: #f3f3f3;
+}
+
+button.kernel-search-tab:focus-visible {
+    outline: 2px solid #1f6feb;
+    outline-offset: 2px;
+}
+
+button.kernel-search-tab.is-active {
+    background: #fbfbfb;
+    border-color: #d8d8d8;
+    color: #111111;
+    font-weight: bold;
+}
+
+span.kernel-search-tab-label {
+    line-height: 1.2;
+}
+
+span.kernel-search-tab-count {
+    color: #666666;
+    font-size: 0.95em;
+}
+
+div.kernel-search-panels {
+    display: flex;
+    flex: 1 1 auto;
+    min-height: 0;
+}
+
+section.kernel-search-panel {
+    flex: 1 1 auto;
+    min-height: 0;
+    overflow-y: auto;
+    overscroll-behavior: contain;
+    -webkit-overflow-scrolling: touch;
+    padding: 0.35rem 1rem 1rem;
+}
+
+section.kernel-search-panel[hidden] {
+    display: none;
+}
+
+ol.kernel-search-list {
+    list-style: none;
+    margin: 0;
+    padding: 0;
+}
+
+li.kernel-search-result {
+    padding: 0.9em 0;
+    border-top: 1px solid #dddddd;
+}
+
+li.kernel-search-result:first-child {
+    border-top: none;
+}
+
+div.kernel-search-result-heading {
+    font-weight: bold;
+}
+
+div.kernel-search-result-heading,
+div.kernel-search-result-heading a,
+div.kernel-search-path,
+div.kernel-search-meta,
+p.kernel-search-summary {
+    overflow-wrap: anywhere;
+    word-break: break-word;
+}
+
+div.kernel-search-path,
+div.kernel-search-meta,
+p.kernel-search-summary {
+    margin-top: 0.3em;
+    color: #555555;
+}
+
+div.kernel-search-path,
+div.kernel-search-meta {
+    font-size: 0.95em;
+}
+
+p.kernel-search-summary {
+    margin-bottom: 0;
+}
+
+p.kernel-search-summary-status {
+    font-style: italic;
+}
+
+p.kernel-search-summary-status.is-error {
+    color: #8b0000;
+}
+
+/* Responsive layout adjustments for narrow and wide screens. */
+@media screen and (max-width: 65em) {
+    div.kernel-search-query-actions {
+        width: 100%;
+        justify-content: flex-start;
+    }
+}
+
+@media screen and (min-width: 65em) {
+    div.kernel-search-result-heading,
+    div.kernel-search-path,
+    div.kernel-search-meta,
+    p.kernel-search-summary {
+        margin-left: 2rem;
+    }
+}
diff --git a/Documentation/sphinx-static/kernel-search.js b/Documentation/sphinx-static/kernel-search.js
new file mode 100644
index 000000000..f762c4be4
--- /dev/null
+++ b/Documentation/sphinx-static/kernel-search.js
@@ -0,0 +1,1182 @@
+"use strict";
+
+// Client-side search UI for Documentation/search.html.
+//
+// This reuses Sphinx-generated language_data.js and searchindex.js,
+// groups results by kind, applies URL-driven filters, and lazily fetches
+// page text for "Pages" summaries.
+(() => {
+  const RESULT_KIND_ORDER = ["object", "title", "index", "text"];
+  const RESULT_KIND_LABELS = {
+    object: "Symbols",
+    title: "Sections",
+    index: "Index entries",
+    text: "Pages",
+  };
+  const TOP_LEVEL_AREA = "__top_level__";
+  // Search ranking policy: higher scores sort first.
+  const LABEL_MATCH_SCORES = {
+    exactMatchBonus: 20,
+    exactCandidateBonus: 10,
+    sectionBase: 15,
+    sectionPartial: 7,
+    indexBase: 20,
+    indexPartial: 8,
+    secondaryIndexPenalty: 5,
+  };
+  const OBJECT_MATCH_SCORES = {
+    exact: 120,
+    exactNameBoost: 11,
+    partialShortName: 6,
+    partialFullName: 4,
+    matchedNameTerm: 1,
+  };
+  const TEXT_MATCH_SCORES = {
+    term: 5,
+    partialTerm: 2,
+    titleTerm: 15,
+    partialTitleTerm: 7,
+    exactTitleBonus: 10,
+  };
+  // Sphinx object priorities: 0 = important, 1 = default, 2 = unimportant.
+  const OBJECT_PRIORITY = {
+    0: 15,
+    1: 5,
+    2: -5,
+  };
+  const SUMMARY_FETCH_BUDGET = 50;
+  const SUMMARY_RESULT_LIMIT = 50;
+  const SUMMARY_VIEWPORT_MARGIN = "200px 0px";
+  const documentTextCache = new Map();
+  let summaryGeneration = 0;
+  let summaryQueue = [];
+  let summaryPayloads = [];
+  let summaryViewportObserver = null;
+  let summaryViewportRoot = null;
+  let activeFetchCount = 0;
+  let activeResultKind = RESULT_KIND_ORDER[0];
+  let pageSummaryLimitEnabled = true;
+  let tabStripCleanup = null;
+
+  // Hook into Sphinx's asynchronous searchindex.js loading.
+  window.Search = window.Search || {};
+  window.Search._callbacks = window.Search._callbacks || [];
+  window.Search._index = window.Search._index || null;
+  window.Search.setIndex = (index) => {
+    window.Search._index = index;
+    const callbacks = window.Search._callbacks.slice();
+    window.Search._callbacks.length = 0;
+    callbacks.forEach((callback) => callback(index));
+  };
+  window.Search.whenReady = (callback) => {
+    if (window.Search._index) callback(window.Search._index);
+    else window.Search._callbacks.push(callback);
+  };
+
+  // Query normalization and Sphinx compatibility helpers.
+  const splitQuery = (query) =>
+    query
+      .split(/[^\p{Letter}\p{Number}_\p{Emoji_Presentation}]+/gu)
+      .filter((term) => term);
+
+  // Fall back to an identity stemmer so search still works if a future
+  // Sphinx change stops providing the Stemmer global.
+  const getStemmer = () =>
+    typeof Stemmer === "function" ? new Stemmer() : { stemWord: (word) => word };
+
+  // Sphinx <= 8 exposes stopwords as an array; 9.x switched to a Set.
+  const hasStopword = (word) => {
+    if (typeof stopwords === "undefined") return false;
+    if (typeof stopwords.has === "function") return stopwords.has(word);
+    if (typeof stopwords.indexOf === "function") return stopwords.indexOf(word) !== -1;
+    return false;
+  };
+
+  const hasOwn = (object, key) =>
+    Object.prototype.hasOwnProperty.call(object, key);
+
+  // Prefer the newer content-root data attribute, but fall back to older
+  // Sphinx builds that still expose URL_ROOT on DOCUMENTATION_OPTIONS.
+  const getContentRoot = () =>
+    document.documentElement.dataset.content_root
+    || (typeof DOCUMENTATION_OPTIONS !== "undefined" ? DOCUMENTATION_OPTIONS.URL_ROOT || "" : "");
+
+  // General utilities, result ordering, and generated-document paths.
+  const compareResults = (left, right) => {
+    if (left.score === right.score) {
+      const leftTitle = left.title.toLowerCase();
+      const rightTitle = right.title.toLowerCase();
+      if (leftTitle === rightTitle) return 0;
+      return leftTitle < rightTitle ? -1 : 1;
+    }
+    return right.score - left.score;
+  };
+
+  const getAreaValue = (docName) =>
+    docName.includes("/") ? docName.split("/", 1)[0] : TOP_LEVEL_AREA;
+
+  const getAreaLabel = (area) =>
+    area === TOP_LEVEL_AREA ? "Top level" : area;
+
+  const matchArea = (docName, area) => {
+    if (!area) return true;
+    if (area === TOP_LEVEL_AREA) return !docName.includes("/");
+    return docName === area || docName.startsWith(area + "/");
+  };
+
+  // Generated-document path handling for html and dirhtml builds.
+  const buildDocUrls = (docName) => {
+    const contentRoot = getContentRoot();
+    const builder = DOCUMENTATION_OPTIONS.BUILDER;
+    const fileSuffix = DOCUMENTATION_OPTIONS.FILE_SUFFIX;
+    const linkSuffix = DOCUMENTATION_OPTIONS.LINK_SUFFIX;
+
+    if (builder === "dirhtml") {
+      let dirname = docName + "/";
+      if (dirname.match(/\/index\/$/)) dirname = dirname.substring(0, dirname.length - 6);
+      else if (dirname === "index/") dirname = "";
+
+      return {
+        requestUrl: contentRoot + dirname,
+        linkUrl: contentRoot + dirname,
+      };
+    }
+
+    return {
+      requestUrl: contentRoot + docName + fileSuffix,
+      linkUrl: docName + linkSuffix,
+    };
+  };
+
+  // Lazy page-summary helpers for "Pages" search results.
+  const htmlToText = (htmlString, anchor) => {
+    const htmlElement = new DOMParser().parseFromString(htmlString, "text/html");
+    for (const selector of [".headerlink", "script", "style"]) {
+      htmlElement.querySelectorAll(selector).forEach((element) => element.remove());
+    }
+
+    if (anchor) {
+      const anchorId = anchor[0] === "#" ? anchor.substring(1) : anchor;
+      const anchorContent = htmlElement.getElementById(anchorId);
+      if (anchorContent) return anchorContent.textContent;
+    }
+
+    const docContent = htmlElement.querySelector('[role="main"]');
+    return docContent ? docContent.textContent : "";
+  };
+
+  const makeSummary = (htmlText, keywords, anchor) => {
+    const text = htmlToText(htmlText, anchor);
+    if (!text) return null;
+
+    const lowered = text.toLowerCase();
+    const positions = keywords
+      .map((keyword) => lowered.indexOf(keyword.toLowerCase()))
+      .filter((position) => position > -1);
+    const actualStart = positions.length ? positions[0] : 0;
+    const start = Math.max(actualStart - 120, 0);
+    const prefix = start === 0 ? "" : "...";
+    const suffix = start + 240 < text.length ? "..." : "";
+
+    const summary = document.createElement("p");
+    summary.className = "kernel-search-summary";
+    summary.textContent = prefix + text.substring(start, start + 240).trim() + suffix;
+    return summary;
+  };
+
+const setSummaryPlaceholder = (payload, text, modifierClass) => {
+    if (!payload.placeholder) {
+      payload.placeholder = document.createElement("p");
+      payload.item.appendChild(payload.placeholder);
+    }
+
+    const classes = ["kernel-search-summary", "kernel-search-summary-status"];
+    if (modifierClass) classes.push(modifierClass);
+    payload.placeholder.className = classes.join(" ");
+    payload.placeholder.textContent = text;
+  };
+
+  const clearSummaryPlaceholder = (payload) => {
+    if (!payload.placeholder) return;
+    payload.placeholder.remove();
+    payload.placeholder = null;
+  };
+
+  const loadDocumentText = (payload) => {
+    if (documentTextCache.has(payload.requestUrl)) {
+      return Promise.resolve(documentTextCache.get(payload.requestUrl));
+    }
+
+    const controller = typeof AbortController === "function"
+      ? new AbortController()
+      : null;
+    payload.abortController = controller;
+
+    return fetch(payload.requestUrl, controller ? { signal: controller.signal } : {})
+      .then((response) => {
+        if (!response.ok) {
+          throw new Error(`Summary request failed: ${response.status}`);
+        }
+        return response.text();
+      })
+      .then((htmlText) => {
+        documentTextCache.set(payload.requestUrl, htmlText);
+        return htmlText;
+      })
+      .finally(() => {
+        if (payload.abortController === controller) payload.abortController = null;
+      });
+  };
+
+  const pushBest = (resultMap, result) => {
+    const key = [result.kind, result.docName, result.anchor || "", result.title].join("|");
+    const existing = resultMap.get(key);
+    if (!existing || existing.score < result.score) resultMap.set(key, result);
+  };
+
+  // Query parsing, scoring, and deduplication.
+  const buildQueryState = (query, exact) => {
+    const rawTerms = splitQuery(query.trim());
+    const rawTermsLower = rawTerms.map((term) => term.toLowerCase());
+    const objectTerms = new Set(rawTermsLower);
+    const highlightTerms = exact ? rawTermsLower : [];
+    const searchTerms = new Set();
+    const excludedTerms = new Set();
+
+    if (!exact) {
+      const stemmer = getStemmer();
+      rawTerms.forEach((term) => {
+        const lowered = term.toLowerCase();
+        if (hasStopword(lowered) || /^\d+$/.test(term)) {
+          return;
+        }
+
+        const word = stemmer.stemWord(lowered);
+        if (!word) return;
+
+        if (word[0] === "-") excludedTerms.add(word.substring(1));
+        else {
+          searchTerms.add(word);
+          highlightTerms.push(lowered);
+        }
+      });
+    } else {
+      rawTermsLower.forEach((term) => searchTerms.add(term));
+    }
+
+    if (typeof SPHINX_HIGHLIGHT_ENABLED !== "undefined" && SPHINX_HIGHLIGHT_ENABLED) {
+      localStorage.setItem("sphinx_highlight_terms", [...new Set(highlightTerms)].join(" "));
+    }
+
+    return {
+      exact,
+      query,
+      queryLower: query.toLowerCase().trim(),
+      rawTerms: rawTermsLower,
+      objectTerms,
+      searchTerms,
+      excludedTerms,
+      highlightTerms: [...new Set(highlightTerms)],
+    };
+  };
+
+  const candidateMatches = (candidateLower, state) => {
+    if (!state.queryLower) return false;
+    if (state.exact) return candidateLower === state.queryLower;
+
+    if (
+      candidateLower.includes(state.queryLower)
+      && state.queryLower.length >= Math.ceil(candidateLower.length / 2)
+    ) {
+      return true;
+    }
+
+    return state.rawTerms.length > 0
+      && state.rawTerms.every((term) => candidateLower.includes(term));
+  };
+
+  const scoreLabelMatch = (candidateLower, state, baseScore, partialScore) => {
+    if (state.exact) return baseScore + LABEL_MATCH_SCORES.exactMatchBonus;
+    if (candidateLower === state.queryLower) {
+      return baseScore + LABEL_MATCH_SCORES.exactCandidateBonus;
+    }
+    if (candidateLower.includes(state.queryLower)) {
+      return Math.max(partialScore, Math.round((baseScore * state.queryLower.length) / candidateLower.length));
+    }
+
+    return partialScore * Math.max(1, state.rawTerms.filter((term) => candidateLower.includes(term)).length);
+  };
+
+  // Result collectors map Sphinx index structures to one result kind each.
+  const collectObjectResults = (index, state, filters) => {
+    const resultMap = new Map();
+    const objects = index.objects || {};
+    const objNames = index.objnames || {};
+    const objTypes = index.objtypes || {};
+
+    const addObjectResult = (prefix, name, match) => {
+      const fileIndex = match[0];
+      const typeIndex = match[1];
+      const priority = match[2];
+      const anchorValue = match[3];
+      const docName = index.docnames[fileIndex];
+      const fileName = index.filenames[fileIndex];
+      const pageTitle = index.titles[fileIndex];
+      const objectLabel = objNames[typeIndex] ? objNames[typeIndex][2] : "Object";
+      const objectType = objTypes[typeIndex];
+
+      if (!matchArea(docName, filters.area)) return;
+      if (filters.objtype && filters.objtype !== objectType) return;
+
+      const fullName = prefix ? prefix + "." + name : name;
+      const fullNameLower = fullName.toLowerCase();
+      const lastNameLower = fullNameLower.split(".").slice(-1)[0];
+      const nameLower = name.toLowerCase();
+
+      let score = 0;
+      if (state.exact) {
+        if (
+          fullNameLower !== state.queryLower
+          && lastNameLower !== state.queryLower
+          && nameLower !== state.queryLower
+        ) {
+          return;
+        }
+        score = OBJECT_MATCH_SCORES.exact;
+      } else {
+        const haystack = `${fullName} ${objectLabel} ${pageTitle}`.toLowerCase();
+        if (state.objectTerms.size === 0) return;
+        if ([...state.objectTerms].some((term) => !haystack.includes(term))) return;
+        const matchedNameTerms = state.rawTerms.filter(
+          (term) =>
+            fullNameLower.includes(term)
+            || lastNameLower.includes(term)
+            || nameLower.includes(term),
+        ).length;
+
+        if (
+          fullNameLower === state.queryLower
+          || lastNameLower === state.queryLower
+          || nameLower === state.queryLower
+        ) {
+          score += OBJECT_MATCH_SCORES.exactNameBoost;
+        } else if (
+          lastNameLower.includes(state.queryLower)
+          || nameLower.includes(state.queryLower)
+        ) {
+          score += OBJECT_MATCH_SCORES.partialShortName;
+        } else if (fullNameLower.includes(state.queryLower)) {
+          score += OBJECT_MATCH_SCORES.partialFullName;
+        } else if (matchedNameTerms > 0) {
+          score += matchedNameTerms * OBJECT_MATCH_SCORES.matchedNameTerm;
+        } else {
+          return;
+        }
+      }
+
+      score += OBJECT_PRIORITY[priority] || 0;
+
+      let anchor = anchorValue;
+      if (anchor === "") anchor = fullName;
+      else if (anchor === "-" && objNames[typeIndex]) anchor = objNames[typeIndex][1] + "-" + fullName;
+
+      pushBest(resultMap, {
+        kind: "object",
+        docName,
+        fileName,
+        title: fullName,
+        anchor: anchor ? "#" + anchor : "",
+        description: `${objectLabel}, in ${pageTitle}`,
+        score,
+      });
+    };
+
+    Object.keys(objects).forEach((prefix) => {
+      const group = objects[prefix];
+
+      // Sphinx 3.x stores objects as name->tuple mappings; 4.x+ switched
+      // to arrays with the display name appended as a fifth element.
+      if (Array.isArray(group)) {
+        group.forEach((match) => {
+          addObjectResult(prefix, match[4], match);
+        });
+        return;
+      }
+
+      Object.entries(group || {}).forEach(([name, match]) => {
+        addObjectResult(prefix, name, match);
+      });
+    });
+
+    return [...resultMap.values()].sort(compareResults);
+  };
+
+  const collectSectionResults = (index, state, filters) => {
+    const resultMap = new Map();
+    const allTitles = index.alltitles || {};
+
+    Object.entries(allTitles).forEach(([sectionTitle, entries]) => {
+      const lowered = sectionTitle.toLowerCase().trim();
+      if (!candidateMatches(lowered, state)) return;
+
+      entries.forEach(([fileIndex, anchorId]) => {
+        const docName = index.docnames[fileIndex];
+        const fileName = index.filenames[fileIndex];
+        const pageTitle = index.titles[fileIndex];
+        if (!matchArea(docName, filters.area)) return;
+
+        if (anchorId === null && sectionTitle === pageTitle) return;
+
+        pushBest(resultMap, {
+          kind: "title",
+          docName,
+          fileName,
+          title: pageTitle !== sectionTitle ? `${pageTitle} > ${sectionTitle}` : sectionTitle,
+          anchor: anchorId ? "#" + anchorId : "",
+          description: pageTitle,
+          score: scoreLabelMatch(
+            lowered,
+            state,
+            LABEL_MATCH_SCORES.sectionBase,
+            LABEL_MATCH_SCORES.sectionPartial,
+          ),
+        });
+      });
+    });
+
+    return [...resultMap.values()].sort(compareResults);
+  };
+
+  const collectIndexResults = (index, state, filters) => {
+    const resultMap = new Map();
+    const entries = index.indexentries || {};
+
+    Object.entries(entries).forEach(([entry, matches]) => {
+      const lowered = entry.toLowerCase().trim();
+      if (!candidateMatches(lowered, state)) return;
+
+      matches.forEach(([fileIndex, anchorId, isMain]) => {
+        const docName = index.docnames[fileIndex];
+        const fileName = index.filenames[fileIndex];
+        const pageTitle = index.titles[fileIndex];
+        if (!matchArea(docName, filters.area)) return;
+
+        let score = scoreLabelMatch(
+          lowered,
+          state,
+          LABEL_MATCH_SCORES.indexBase,
+          LABEL_MATCH_SCORES.indexPartial,
+        );
+        if (!isMain) score -= LABEL_MATCH_SCORES.secondaryIndexPenalty;
+
+        pushBest(resultMap, {
+          kind: "index",
+          docName,
+          fileName,
+          title: entry,
+          anchor: anchorId ? "#" + anchorId : "",
+          description: pageTitle,
+          score,
+        });
+      });
+    });
+
+    return [...resultMap.values()].sort(compareResults);
+  };
+
+  const collectTextResults = (index, state, filters) => {
+    // Intersect per-word matches from the inverted index and keep the
+    // best score contribution for each matched term per file.
+    const resultMap = new Map();
+    const terms = index.terms || {};
+    const titleTerms = index.titleterms || {};
+    const searchTerms = [...state.searchTerms];
+
+    if (searchTerms.length === 0) return [];
+
+    const scoreMap = new Map();
+    const fileMap = new Map();
+
+    searchTerms.forEach((word) => {
+      const files = [];
+      const candidates = [
+        {
+          files: hasOwn(terms, word) ? terms[word] : undefined,
+          score: TEXT_MATCH_SCORES.term,
+        },
+        {
+          files: hasOwn(titleTerms, word) ? titleTerms[word] : undefined,
+          score: TEXT_MATCH_SCORES.titleTerm,
+        },
+      ];
+
+      if (!state.exact && word.length > 2) {
+        if (!hasOwn(terms, word)) {
+          Object.keys(terms).forEach((term) => {
+            if (term.includes(word)) {
+              candidates.push({ files: terms[term], score: TEXT_MATCH_SCORES.partialTerm });
+            }
+          });
+        }
+        if (!hasOwn(titleTerms, word)) {
+          Object.keys(titleTerms).forEach((term) => {
+            if (term.includes(word)) {
+              candidates.push({ files: titleTerms[term], score: TEXT_MATCH_SCORES.partialTitleTerm });
+            }
+          });
+        }
+      }
+
+      if (candidates.every((candidate) => candidate.files === undefined)) return;
+
+      candidates.forEach((candidate) => {
+        if (candidate.files === undefined) return;
+
+        let recordFiles = candidate.files;
+        if (recordFiles.length === undefined) recordFiles = [recordFiles];
+        files.push(...recordFiles);
+
+        recordFiles.forEach((fileIndex) => {
+          if (!scoreMap.has(fileIndex)) scoreMap.set(fileIndex, new Map());
+          const currentScore = scoreMap.get(fileIndex).get(word) || 0;
+          scoreMap.get(fileIndex).set(word, Math.max(currentScore, candidate.score));
+        });
+      });
+
+      files.forEach((fileIndex) => {
+        if (!fileMap.has(fileIndex)) fileMap.set(fileIndex, [word]);
+        else if (!fileMap.get(fileIndex).includes(word)) fileMap.get(fileIndex).push(word);
+      });
+    });
+
+    const filteredTermCount = state.exact
+      ? searchTerms.length
+      : searchTerms.filter((term) => term.length > 2).length;
+
+    for (const [fileIndex, matchedWords] of fileMap.entries()) {
+      const docName = index.docnames[fileIndex];
+      const fileName = index.filenames[fileIndex];
+      if (!matchArea(docName, filters.area)) continue;
+
+      if (matchedWords.length !== searchTerms.length && matchedWords.length !== filteredTermCount) {
+        continue;
+      }
+
+      if (
+        [...state.excludedTerms].some(
+          (term) =>
+            terms[term] === fileIndex
+            || titleTerms[term] === fileIndex
+            || (terms[term] || []).includes(fileIndex)
+            || (titleTerms[term] || []).includes(fileIndex),
+        )
+      ) {
+        continue;
+      }
+
+      let score = Math.max(...matchedWords.map((word) => scoreMap.get(fileIndex).get(word)));
+      if (state.exact && index.titles[fileIndex].toLowerCase() === state.queryLower) {
+        score += TEXT_MATCH_SCORES.exactTitleBonus;
+      }
+
+      pushBest(resultMap, {
+        kind: "text",
+        docName,
+        fileName,
+        title: index.titles[fileIndex],
+        anchor: "",
+        description: null,
+        score,
+      });
+    }
+
+    return [...resultMap.values()].sort(compareResults);
+  };
+
+  const buildFilters = (state) => ({
+    area: state.area,
+    objtype: state.objtype,
+  });
+
+  // Rendering and lazy summary loading.
+  const resetSummaryState = () => {
+    summaryGeneration += 1;
+    summaryQueue = [];
+    activeFetchCount = 0;
+
+    if (summaryViewportObserver) {
+      summaryViewportObserver.disconnect();
+      summaryViewportObserver = null;
+    }
+    summaryViewportRoot = null;
+
+    summaryPayloads.forEach((payload) => {
+      if (payload.status !== "loading") return;
+      payload.loadToken += 1;
+      payload.status = "idle";
+      clearSummaryPlaceholder(payload);
+      if (payload.abortController) {
+        payload.abortController.abort();
+        payload.abortController = null;
+      }
+    });
+    summaryPayloads = [];
+  };
+
+  const finishSummaryLoad = (task) => {
+    const payload = task.payload;
+    activeFetchCount = Math.max(0, activeFetchCount - 1);
+    if (payload.loadToken !== task.loadToken) {
+      drainSummaryQueue();
+      return;
+    }
+    drainSummaryQueue();
+  };
+
+  const markSummaryError = (payload) => {
+    payload.status = "error";
+    setSummaryPlaceholder(payload, "Summary unavailable.", "is-error");
+  };
+
+  const runSummaryLoad = (payload) => {
+    if (payload.generation !== summaryGeneration || payload.status !== "queued") {
+      return;
+    }
+
+    payload.status = "loading";
+    setSummaryPlaceholder(payload, "Loading summary...", "is-loading");
+    payload.loadToken += 1;
+    const task = {
+      loadToken: payload.loadToken,
+      payload,
+    };
+    activeFetchCount += 1;
+    loadDocumentText(payload)
+      .then((htmlText) => {
+        if (
+          payload.loadToken !== task.loadToken
+          || payload.generation !== summaryGeneration
+          || payload.status !== "loading"
+        ) {
+          return;
+        }
+
+        const summary = makeSummary(htmlText, payload.keywords, payload.anchor);
+        if (!summary) {
+          markSummaryError(payload);
+          return;
+        }
+
+        clearSummaryPlaceholder(payload);
+        payload.item.appendChild(summary);
+        payload.status = "done";
+      })
+      .catch(() => {
+        if (payload.loadToken !== task.loadToken || payload.status !== "loading") return;
+        markSummaryError(payload);
+      })
+      .finally(() => finishSummaryLoad(task));
+  };
+
+  const drainSummaryQueue = () => {
+    while (activeFetchCount < SUMMARY_FETCH_BUDGET && summaryQueue.length) {
+      const payload = summaryQueue.shift();
+      if (!payload) break;
+      if (payload.generation !== summaryGeneration || payload.status !== "queued") continue;
+      runSummaryLoad(payload);
+    }
+  };
+
+  const enqueueSummaryLoad = (payload) => {
+    if (
+      !payload
+      || payload.generation !== summaryGeneration
+      || payload.status !== "idle"
+      || (pageSummaryLimitEnabled && payload.summaryIndex >= SUMMARY_RESULT_LIMIT)
+    ) {
+      return;
+    }
+
+    payload.status = "queued";
+    summaryQueue.push(payload);
+    drainSummaryQueue();
+  };
+
+  const cancelSummaryLoad = (payload) => {
+    if (payload.status !== "queued" && payload.status !== "loading") return;
+    payload.loadToken += 1;
+    payload.status = "idle";
+    clearSummaryPlaceholder(payload);
+    if (payload.abortController) {
+      payload.abortController.abort();
+      payload.abortController = null;
+    }
+  };
+
+  const boostSummaryPayload = (payload) => {
+    if (payload.generation !== summaryGeneration) return;
+    if (payload.status === "queued") {
+      const index = summaryQueue.indexOf(payload);
+      if (index > 0) {
+        summaryQueue.splice(index, 1);
+        summaryQueue.unshift(payload);
+      }
+      drainSummaryQueue();
+    } else if (payload.status === "idle") {
+      enqueueSummaryLoad(payload);
+    }
+  };
+
+  const ensureViewportObserver = (rootElement) => {
+    if (summaryViewportObserver && summaryViewportRoot === rootElement) {
+      return summaryViewportObserver;
+    }
+    if (summaryViewportObserver) {
+      summaryViewportObserver.disconnect();
+      summaryViewportObserver = null;
+    }
+    summaryViewportRoot = rootElement;
+    if (typeof IntersectionObserver !== "function") return null;
+
+    summaryViewportObserver = new IntersectionObserver((entries) => {
+      entries.forEach((entry) => {
+        if (!entry.isIntersecting) return;
+        const payload = summaryPayloads.find((p) => p.item === entry.target);
+        if (payload) boostSummaryPayload(payload);
+      });
+    }, {
+      root: rootElement,
+      rootMargin: SUMMARY_VIEWPORT_MARGIN,
+    });
+
+    return summaryViewportObserver;
+  };
+
+  const activateSummaryLoads = (rootElement) => {
+    const observer = ensureViewportObserver(rootElement);
+
+    summaryQueue = summaryQueue.filter((payload) => {
+      if (payload.generation !== summaryGeneration || payload.status !== "queued") return false;
+      if (pageSummaryLimitEnabled && payload.summaryIndex >= SUMMARY_RESULT_LIMIT) {
+        cancelSummaryLoad(payload);
+        return false;
+      }
+      return true;
+    });
+
+    summaryPayloads.forEach((payload) => {
+      if (payload.generation !== summaryGeneration) return;
+      if (pageSummaryLimitEnabled && payload.summaryIndex >= SUMMARY_RESULT_LIMIT) {
+        if (payload.status === "queued" || payload.status === "loading") {
+          cancelSummaryLoad(payload);
+        }
+        return;
+      }
+      if (observer) observer.observe(payload.item);
+      if (payload.status !== "idle") return;
+      enqueueSummaryLoad(payload);
+    });
+
+    drainSummaryQueue();
+  };
+
+  const pauseSummaryLoads = () => {
+    if (summaryViewportObserver) {
+      summaryViewportObserver.disconnect();
+      summaryViewportObserver = null;
+    }
+    summaryViewportRoot = null;
+    summaryQueue = [];
+    summaryPayloads.forEach((payload) => cancelSummaryLoad(payload));
+  };
+
+  const resetTabStripState = () => {
+    if (!tabStripCleanup) return;
+    tabStripCleanup();
+    tabStripCleanup = null;
+  };
+
+  const bindTabStripShadows = (frame, scroller) => {
+    resetTabStripState();
+
+    const syncShadows = () => {
+      const maxScrollLeft = Math.max(0, scroller.scrollWidth - scroller.clientWidth);
+      const hasOverflow = maxScrollLeft > 1;
+      frame.classList.toggle("has-left-shadow", hasOverflow && scroller.scrollLeft > 1);
+      frame.classList.toggle(
+        "has-right-shadow",
+        hasOverflow && scroller.scrollLeft < maxScrollLeft - 1,
+      );
+    };
+
+    scroller.addEventListener("scroll", syncShadows, { passive: true });
+    if (typeof ResizeObserver === "function") {
+      const resizeObserver = new ResizeObserver(syncShadows);
+      resizeObserver.observe(scroller);
+      tabStripCleanup = () => {
+        scroller.removeEventListener("scroll", syncShadows);
+        resizeObserver.disconnect();
+      };
+    } else {
+      window.addEventListener("resize", syncShadows);
+      tabStripCleanup = () => {
+        scroller.removeEventListener("scroll", syncShadows);
+        window.removeEventListener("resize", syncShadows);
+      };
+    }
+
+    window.requestAnimationFrame(syncShadows);
+  };
+
+  const createResultItem = (result, keywords, summaryIndex) => {
+    const urls = buildDocUrls(result.docName);
+    const item = document.createElement("li");
+    item.className = `kernel-search-result kind-${result.kind}`;
+
+    const heading = item.appendChild(document.createElement("div"));
+    heading.className = "kernel-search-result-heading";
+
+    const link = heading.appendChild(document.createElement("a"));
+    link.href = urls.linkUrl + result.anchor;
+    link.dataset.score = String(result.score);
+    link.textContent = result.title;
+
+    const path = item.appendChild(document.createElement("div"));
+    path.className = "kernel-search-path";
+    path.textContent = result.fileName;
+
+    if (result.description) {
+      const meta = item.appendChild(document.createElement("div"));
+      meta.className = "kernel-search-meta";
+      meta.textContent = result.description;
+    }
+
+    if (result.kind === "text") {
+      const payload = {
+        abortController: null,
+        anchor: result.anchor,
+        generation: summaryGeneration,
+        item,
+        keywords,
+        loadToken: 0,
+        placeholder: null,
+        requestUrl: urls.requestUrl,
+        summaryIndex,
+        status: "idle",
+      };
+      summaryPayloads.push(payload);
+    }
+    return item;
+  };
+
+  const renderResults = (state, resultsByKind) => {
+    const container = document.getElementById("kernel-search-results");
+    const totalResults = RESULT_KIND_ORDER.reduce(
+      (count, kind) => count + resultsByKind[kind].length,
+      0,
+    );
+    resetSummaryState();
+    resetTabStripState();
+    container.replaceChildren();
+
+    const summary = document.createElement("p");
+    summary.className = "kernel-search-status";
+    if (!state.queryLower) {
+      summary.textContent = "Enter a search query to browse kernel documentation.";
+      container.appendChild(summary);
+      return;
+    }
+
+    if (!totalResults) {
+      summary.textContent =
+        "No matching results were found for the current query and filters.";
+      container.appendChild(summary);
+      return;
+    }
+
+    summary.textContent =
+      `Found ${totalResults} result${totalResults === 1 ? "" : "s"} for "${state.query}".`;
+    container.appendChild(summary);
+
+    const availableKinds = RESULT_KIND_ORDER.filter((kind) => resultsByKind[kind].length);
+    const shell = container.appendChild(document.createElement("div"));
+    shell.className = "kernel-search-results-shell";
+
+    const tabFrame = shell.appendChild(document.createElement("div"));
+    tabFrame.className = "kernel-search-tab-strip";
+
+    const tabScroller = tabFrame.appendChild(document.createElement("div"));
+    tabScroller.className = "kernel-search-tab-scroller";
+    tabScroller.setAttribute("role", "tablist");
+    tabScroller.setAttribute("aria-label", "Search result kinds");
+
+    const toolRow = shell.appendChild(document.createElement("div"));
+    toolRow.className = "kernel-search-panel-tools";
+    toolRow.hidden = true;
+
+    const summaryLimitLabel = toolRow.appendChild(document.createElement("label"));
+    summaryLimitLabel.className = "kernel-search-checkbox kernel-search-summary-limit";
+    summaryLimitLabel.hidden = !availableKinds.includes("text");
+
+    const summaryLimitToggle = summaryLimitLabel.appendChild(document.createElement("input"));
+    summaryLimitToggle.type = "checkbox";
+    summaryLimitToggle.checked = pageSummaryLimitEnabled;
+
+    const summaryLimitText = summaryLimitLabel.appendChild(document.createElement("span"));
+    summaryLimitText.textContent = "Limit page summaries to first 50";
+
+    const panels = shell.appendChild(document.createElement("div"));
+    panels.className = "kernel-search-panels";
+
+    const tabButtons = new Map();
+    const tabPanels = new Map();
+
+    const selectTab = (kind, focusTab) => {
+      activeResultKind = kind;
+      tabButtons.forEach((button, buttonKind) => {
+        const active = buttonKind === kind;
+        button.classList.toggle("is-active", active);
+        button.setAttribute("aria-selected", active ? "true" : "false");
+        button.tabIndex = active ? 0 : -1;
+        if (active && focusTab) {
+          button.focus();
+          button.scrollIntoView({ block: "nearest", inline: "nearest" });
+        }
+      });
+
+      tabPanels.forEach((panel, panelKind) => {
+        const active = panelKind === kind;
+        panel.hidden = !active;
+        panel.classList.toggle("is-active", active);
+      });
+
+      toolRow.hidden = kind !== "text";
+
+      if (kind === "text") {
+        const panel = tabPanels.get("text");
+        if (panel) activateSummaryLoads(panel);
+      } else {
+        pauseSummaryLoads();
+      }
+    };
+
+    const handleTabKeydown = (event) => {
+      const currentIndex = availableKinds.indexOf(activeResultKind);
+      if (currentIndex === -1) return;
+
+      let nextIndex = -1;
+      switch (event.key) {
+        case "ArrowLeft":
+        case "ArrowUp":
+          nextIndex = (currentIndex + availableKinds.length - 1) % availableKinds.length;
+          break;
+        case "ArrowRight":
+        case "ArrowDown":
+          nextIndex = (currentIndex + 1) % availableKinds.length;
+          break;
+        case "Home":
+          nextIndex = 0;
+          break;
+        case "End":
+          nextIndex = availableKinds.length - 1;
+          break;
+        default:
+          return;
+      }
+
+      event.preventDefault();
+      selectTab(availableKinds[nextIndex], true);
+    };
+
+    RESULT_KIND_ORDER.forEach((kind) => {
+      const results = resultsByKind[kind];
+      if (!results.length) return;
+
+      const tab = tabScroller.appendChild(document.createElement("button"));
+      tab.type = "button";
+      tab.className = `kernel-search-tab kind-${kind}`;
+      tab.id = `kernel-search-tab-${kind}`;
+      tab.setAttribute("role", "tab");
+      tab.setAttribute("aria-controls", `kernel-search-panel-${kind}`);
+      tab.addEventListener("click", () => selectTab(kind, false));
+      tab.addEventListener("keydown", handleTabKeydown);
+      tabButtons.set(kind, tab);
+
+      const label = tab.appendChild(document.createElement("span"));
+      label.className = "kernel-search-tab-label";
+      label.textContent = RESULT_KIND_LABELS[kind];
+
+      const count = tab.appendChild(document.createElement("span"));
+      count.className = "kernel-search-tab-count";
+      count.textContent = String(results.length);
+
+      const panel = panels.appendChild(document.createElement("section"));
+      panel.className = `kernel-search-panel kind-${kind}`;
+      panel.id = `kernel-search-panel-${kind}`;
+      panel.setAttribute("role", "tabpanel");
+      panel.setAttribute("aria-labelledby", tab.id);
+      panel.hidden = true;
+      tabPanels.set(kind, panel);
+
+      const list = panel.appendChild(document.createElement("ol"));
+      list.className = "kernel-search-list";
+
+      results.forEach((result, index) => {
+        list.appendChild(
+          createResultItem(
+            result,
+            state.highlightTerms,
+            index,
+          ),
+        );
+      });
+    });
+
+    summaryLimitToggle.addEventListener("change", () => {
+      pageSummaryLimitEnabled = summaryLimitToggle.checked;
+      if (activeResultKind === "text") {
+        const panel = tabPanels.get("text");
+        if (panel) activateSummaryLoads(panel);
+      }
+    });
+
+    bindTabStripShadows(tabFrame, tabScroller);
+    const defaultKind = availableKinds.includes(activeResultKind)
+      ? activeResultKind
+      : availableKinds[0];
+    selectTab(defaultKind, false);
+  };
+
+  // Form-state parsing, dynamic filter options, and page initialization.
+  const populateAreaOptions = (select, state) => {
+    const areas = new Set();
+    window.Search._index.docnames.forEach((docName) => areas.add(getAreaValue(docName)));
+
+    const options = [new Option("All documentation areas", "", false, !state.area)];
+    [...areas]
+      .sort((left, right) => {
+        if (left === TOP_LEVEL_AREA) return -1;
+        if (right === TOP_LEVEL_AREA) return 1;
+        return left.localeCompare(right);
+      })
+      .forEach((area) => {
+        options.push(new Option(getAreaLabel(area), area, false, area === state.area));
+      });
+
+    select.replaceChildren(...options);
+  };
+
+  const populateObjectTypeOptions = (select, state) => {
+    const objTypes = window.Search._index.objtypes || {};
+    const objNames = window.Search._index.objnames || {};
+    const entries = Object.keys(objTypes)
+      .map((key) => ({
+        value: objTypes[key],
+        label: objNames[key] ? objNames[key][2] : objTypes[key],
+      }))
+      .sort((left, right) => left.label.localeCompare(right.label));
+
+    const seen = new Set();
+    const options = [new Option("All object types", "", false, !state.objtype)];
+    entries.forEach((entry) => {
+      if (seen.has(entry.value)) return;
+      seen.add(entry.value);
+      options.push(new Option(entry.label, entry.value, false, entry.value === state.objtype));
+    });
+
+    select.replaceChildren(...options);
+  };
+
+  const parseState = () => {
+    const params = new URLSearchParams(window.location.search);
+    const kinds = params.getAll("kind").filter((kind) => RESULT_KIND_ORDER.includes(kind));
+
+    return {
+      query: params.get("q") || "",
+      queryLower: (params.get("q") || "").toLowerCase().trim(),
+      exact: params.get("exact") === "1",
+      area: params.get("area") || "",
+      objtype: params.get("objtype") || "",
+      advanced: params.get("advanced") === "1",
+      kinds: kinds.length ? new Set(kinds) : new Set(RESULT_KIND_ORDER),
+    };
+  };
+
+  const shouldOpenAdvanced = (state) =>
+    state.advanced
+    || state.exact
+    || state.area !== ""
+    || state.objtype !== ""
+    || RESULT_KIND_ORDER.some((kind) => !state.kinds.has(kind));
+
+  const bindFormState = (state) => {
+    document.getElementById("kernel-search-query").value = state.query;
+    document.getElementById("kernel-search-exact").checked = state.exact;
+    RESULT_KIND_ORDER.forEach((kind) => {
+      const checkbox = document.getElementById(`kernel-search-kind-${kind}`);
+      if (checkbox) checkbox.checked = state.kinds.has(kind);
+    });
+
+    const advanced = document.getElementById("kernel-search-advanced");
+    const advancedFlag = document.getElementById("kernel-search-advanced-flag");
+    const open = shouldOpenAdvanced(state);
+    advanced.open = open;
+    advancedFlag.disabled = !open;
+    advanced.addEventListener("toggle", () => {
+      advancedFlag.disabled = !advanced.open;
+    });
+  };
+
+  const runSearch = () => {
+    const baseState = parseState();
+    bindFormState(baseState);
+    populateAreaOptions(document.getElementById("kernel-search-area"), baseState);
+    populateObjectTypeOptions(document.getElementById("kernel-search-objtype"), baseState);
+
+    const queryState = buildQueryState(baseState.query, baseState.exact);
+    const renderState = {
+      ...baseState,
+      highlightTerms: queryState.highlightTerms,
+    };
+    const filters = buildFilters(baseState);
+    const resultsByKind = {
+      object: [],
+      title: [],
+      index: [],
+      text: [],
+    };
+
+    if (!baseState.queryLower) {
+      renderResults(renderState, resultsByKind);
+      return;
+    }
+
+    if (baseState.kinds.has("object")) {
+      resultsByKind.object = collectObjectResults(window.Search._index, queryState, filters);
+    }
+    if (baseState.kinds.has("title")) {
+      resultsByKind.title = collectSectionResults(window.Search._index, queryState, filters);
+    }
+    if (baseState.kinds.has("index")) {
+      resultsByKind.index = collectIndexResults(window.Search._index, queryState, filters);
+    }
+    if (baseState.kinds.has("text")) {
+      resultsByKind.text = collectTextResults(window.Search._index, queryState, filters);
+    }
+
+    renderResults(renderState, resultsByKind);
+  };
+
+  document.addEventListener("DOMContentLoaded", () => {
+    const container = document.getElementById("kernel-search-results");
+    if (!container) return;
+
+    const progress = document.getElementById("search-progress");
+    if (progress) progress.textContent = "Preparing search...";
+
+    window.Search.whenReady(() => {
+      if (progress) progress.textContent = "";
+      runSearch();
+    });
+  });
+})();
diff --git a/Documentation/sphinx/templates/search.html b/Documentation/sphinx/templates/search.html
new file mode 100644
index 000000000..311e15559
--- /dev/null
+++ b/Documentation/sphinx/templates/search.html
@@ -0,0 +1,117 @@
+{# SPDX-License-Identifier: GPL-2.0 #}
+
+{# Enhanced search page for kernel documentation. #}
+{%- extends "layout.html" %}
+{% set title = _('Search') %}
+{%- block scripts %}
+    {{ super() }}
+    {#
+      Load Sphinx language data plus the kernel-specific search runtime.
+      searchindex.js later populates the shared Search index consumed here,
+      so keep this boot order intact.
+    #}
+    <script src="{{ pathto('_static/language_data.js', 1) }}"></script>
+    <script src="{{ pathto('_static/kernel-search.js', 1) }}"></script>
+{%- endblock %}
+{% block extrahead %}
+    <script src="{{ pathto('searchindex.js', 1) }}" defer="defer"></script>
+    <meta name="robots" content="noindex" />
+    {{ super() }}
+{% endblock %}
+{% block body %}
+  <h1 id="search-documentation">{{ _('Search') }}</h1>
+  <noscript>
+  <div class="admonition warning">
+  <p>
+    {% trans %}Please activate JavaScript to enable the search
+    functionality.{% endtrans %}
+  </p>
+  </div>
+  </noscript>
+  <p class="kernel-search-help">
+    {% trans %}Searching for multiple words only shows matches that contain
+    all words.{% endtrans %}
+  </p>
+  {#
+    This markup is a shared contract with kernel-search.js and custom.css.
+    Keep search form/result IDs and classes in sync with both files when
+    changing this template.
+  #}
+  <form id="kernel-search-form" class="kernel-search-form" action="" method="get">
+    <div class="kernel-search-query-row">
+      <div class="kernel-search-query-field">
+        <label for="kernel-search-query">{{ _('Search query') }}</label>
+        <input
+          id="kernel-search-query"
+          type="text"
+          name="q"
+          value=""
+          autocomplete="off"
+          autocorrect="off"
+          autocapitalize="off"
+          spellcheck="false"
+        />
+      </div>
+      <div class="kernel-search-query-actions">
+        <input type="submit" value="{{ _('Search') }}" />
+        <span id="search-progress" class="kernel-search-progress"></span>
+      </div>
+    </div>
+
+    <details id="kernel-search-advanced" class="kernel-search-advanced">
+      {# Keep advanced filters optional while preserving them in the URL. #}
+      <summary>{{ _('Advanced search') }}</summary>
+      <input
+        id="kernel-search-advanced-flag"
+        type="hidden"
+        name="advanced"
+        value="1"
+        disabled="disabled"
+      />
+      <div class="kernel-search-advanced-grid">
+        <div class="kernel-search-field">
+          <label class="kernel-search-checkbox" for="kernel-search-exact">
+            <input id="kernel-search-exact" type="checkbox" name="exact" value="1" />
+            <span>{{ _('Exact identifier match') }}</span>
+          </label>
+        </div>
+
+        <fieldset class="kernel-search-kind-filters">
+          <legend>{{ _('Result kinds') }}</legend>
+          <label class="kernel-search-checkbox" for="kernel-search-kind-object">
+            <input id="kernel-search-kind-object" type="checkbox" name="kind" value="object" />
+            <span>{{ _('Symbols') }}</span>
+          </label>
+          <label class="kernel-search-checkbox" for="kernel-search-kind-title">
+            <input id="kernel-search-kind-title" type="checkbox" name="kind" value="title" />
+            <span>{{ _('Sections') }}</span>
+          </label>
+          <label class="kernel-search-checkbox" for="kernel-search-kind-index">
+            <input id="kernel-search-kind-index" type="checkbox" name="kind" value="index" />
+            <span>{{ _('Index entries') }}</span>
+          </label>
+          <label class="kernel-search-checkbox" for="kernel-search-kind-text">
+            <input id="kernel-search-kind-text" type="checkbox" name="kind" value="text" />
+            <span>{{ _('Pages') }}</span>
+          </label>
+        </fieldset>
+
+        <div class="kernel-search-field">
+          <label for="kernel-search-area">{{ _('Documentation area') }}</label>
+          <select id="kernel-search-area" name="area">
+            <option value="">{{ _('All documentation areas') }}</option>
+          </select>
+        </div>
+
+        <div class="kernel-search-field">
+          <label for="kernel-search-objtype">{{ _('Object type') }}</label>
+          <select id="kernel-search-objtype" name="objtype">
+            <option value="">{{ _('All object types') }}</option>
+          </select>
+        </div>
+      </div>
+    </details>
+  </form>
+
+  <div id="kernel-search-results" class="kernel-search-results"></div>
+{% endblock %}
diff --git a/Documentation/sphinx/templates/searchbox.html b/Documentation/sphinx/templates/searchbox.html
new file mode 100644
index 000000000..9e00e27cb
--- /dev/null
+++ b/Documentation/sphinx/templates/searchbox.html
@@ -0,0 +1,30 @@
+{# SPDX-License-Identifier: GPL-2.0 #}
+
+{# Sphinx sidebar template: quick search box plus advanced search link. #}
+{%- if pagename != "search" and builder != "singlehtml" %}
+<search id="searchbox" style="display: none" role="search">
+  <h3 id="searchlabel">{{ _('Quick search') }}</h3>
+    <div class="searchformwrapper">
+    <form class="search" action="{{ pathto('search') }}" method="get">
+      <input
+        type="text"
+        name="q"
+        aria-labelledby="searchlabel"
+        autocomplete="off"
+        autocorrect="off"
+        autocapitalize="off"
+        spellcheck="false"
+      />
+      <input type="submit" value="{{ _('Go') }}" />
+    </form>
+    </div>
+    <p class="search-advanced-link">
+      {#
+        Keep this entrypoint using ?advanced=1 so the full search page
+        opens with advanced filters enabled.
+      #}
+      <a href="{{ pathto('search') }}?advanced=1">{{ _('Advanced search') }}</a>
+    </p>
+</search>
+<script>document.getElementById('searchbox').style.display = "block"</script>
+{%- endif %}
diff --git a/MAINTAINERS b/MAINTAINERS
index c3fe46d7c..c9e50b101 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7652,6 +7652,16 @@ X:	Documentation/power/
 X:	Documentation/spi/
 X:	Documentation/userspace-api/media/
 
+DOCUMENTATION ADVANCED SEARCH
+R:	Rito <rito@ritovision.com>
+L:	linux-doc@vger.kernel.org
+S:	Maintained
+F:	Documentation/sphinx-static/kernel-search.js
+F:	Documentation/sphinx-static/custom.css
+F:	Documentation/sphinx/templates/search.html
+F:	Documentation/sphinx/templates/searchbox.html
+F:	tools/docs/test_advanced_search.py
+
 DOCUMENTATION PROCESS
 M:	Jonathan Corbet <corbet@lwn.net>
 R:	Shuah Khan <skhan@linuxfoundation.org>
diff --git a/tools/docs/test_advanced_search.py b/tools/docs/test_advanced_search.py
new file mode 100755
index 000000000..0d379da9d
--- /dev/null
+++ b/tools/docs/test_advanced_search.py
@@ -0,0 +1,312 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+Build a small documentation subset and verify the advanced search artifacts.
+"""
+
+from __future__ import annotations
+
+import argparse
+import os
+import re
+import shlex
+import shutil
+import subprocess
+import sys
+import tempfile
+
+from pathlib import Path
+
+
+SCRIPT = Path(__file__).resolve()
+SRCTREE = SCRIPT.parents[2]
+DEFAULT_SPHINXDIRS = ("kernel-hacking", "PCI")
+REQUIRED_SEARCH_IDS = (
+    'id="kernel-search-form"',
+    'id="kernel-search-query"',
+    'id="search-progress"',
+    'id="kernel-search-advanced"',
+    'id="kernel-search-advanced-flag"',
+    'id="kernel-search-area"',
+    'id="kernel-search-objtype"',
+    'id="kernel-search-results"',
+)
+REQUIRED_SEARCH_INDEX_KEYS = (
+    "docnames",
+    "filenames",
+    "titles",
+    "objects",
+    "objnames",
+    "objtypes",
+    "terms",
+    "titleterms",
+)
+OPTIONAL_SEARCH_INDEX_KEYS = (
+    "alltitles",
+    "indexentries",
+)
+REQUIRED_RUNTIME_SNIPPETS = (
+    "const SUMMARY_RESULT_LIMIT = 50;",
+    'setSummaryPlaceholder(payload, "Loading summary...", "is-loading");',
+    'setSummaryPlaceholder(payload, "Summary unavailable.", "is-error");',
+    "pageSummaryLimitEnabled && payload.summaryIndex >= SUMMARY_RESULT_LIMIT",
+    "documentTextCache.set(payload.requestUrl, htmlText);",
+    "highlightTerms: queryState.highlightTerms,",
+)
+
+
+def fail(message):
+    """Raise a readable assertion failure."""
+
+    raise AssertionError(message)
+
+
+def read_text(path):
+    """Read a UTF-8 text file or fail with context."""
+
+    try:
+        return path.read_text(encoding="utf-8")
+    except OSError as exc:
+        fail(f"Failed to read {path}: {exc}")
+
+
+def ensure_file(path, description):
+    """Ensure a generated file exists."""
+
+    if not path.is_file():
+        fail(f"Missing {description}: {path}")
+
+
+def parse_args():
+    """Parse command-line arguments."""
+
+    parser = argparse.ArgumentParser(
+        description=(
+            "Build a small docs subset and verify the generated advanced "
+            "search page, static assets, and search index contract."
+        )
+    )
+    parser.add_argument(
+        "--build-dir",
+        type=Path,
+        help=(
+            "Out-of-tree build directory passed to make via O=. "
+            "If omitted, a temporary directory is created."
+        ),
+    )
+    parser.add_argument(
+        "--keep-build-dir",
+        action="store_true",
+        help="Keep the temporary build directory after the test completes.",
+    )
+    parser.add_argument(
+        "--make",
+        default="make",
+        help="Path to the make executable. Default: make.",
+    )
+    parser.add_argument(
+        "--sphinxdirs",
+        nargs="+",
+        default=list(DEFAULT_SPHINXDIRS),
+        help=(
+            "Documentation subtrees to build via SPHINXDIRS. "
+            f"Default: {' '.join(DEFAULT_SPHINXDIRS)}."
+        ),
+    )
+    return parser.parse_args()
+
+
+def prepare_build_dir(args):
+    """Prepare the build directory and return it with cleanup metadata."""
+
+    if args.build_dir:
+        build_dir = args.build_dir.resolve()
+        if build_dir.exists() and any(build_dir.iterdir()):
+            fail(f"Build directory is not empty: {build_dir}")
+        build_dir.mkdir(parents=True, exist_ok=True)
+        return build_dir, False
+
+    build_dir = Path(tempfile.mkdtemp(prefix="advanced-search-docs-"))
+    return build_dir, not args.keep_build_dir
+
+
+def find_sphinx_build():
+    """Find a usable sphinx-build binary for the documentation build."""
+
+    env_sphinx = os.environ.get("SPHINXBUILD")
+    if env_sphinx:
+        path = Path(env_sphinx).expanduser()
+        if path.is_file() and os.access(path, os.X_OK):
+            return str(path)
+
+    local_venv_sphinx = SRCTREE / ".venv" / "bin" / "sphinx-build"
+    if local_venv_sphinx.is_file() and os.access(local_venv_sphinx, os.X_OK):
+        return str(local_venv_sphinx)
+
+    return shutil.which("sphinx-build")
+
+
+def run_build(args, build_dir):
+    """Build the configured documentation subset."""
+
+    command = [args.make, f"O={build_dir}"]
+    sphinx_build = find_sphinx_build()
+    if sphinx_build:
+        command.append(f"SPHINXBUILD={sphinx_build}")
+
+    command += [
+        f"SPHINXDIRS={' '.join(args.sphinxdirs)}",
+        "htmldocs",
+    ]
+    print("$", shlex.join(command))
+
+    subprocess.run(command, cwd=SRCTREE, check=True)
+
+    output_dir = build_dir / "Documentation" / "output"
+    if not output_dir.is_dir():
+        fail(f"Expected documentation output directory was not created: {output_dir}")
+
+    return output_dir
+
+
+def find_search_roots(output_dir):
+    """Find all generated HTML roots that expose advanced search."""
+
+    roots = []
+    for search_html in sorted(output_dir.rglob("search.html")):
+        if search_html.parent.joinpath("searchindex.js").is_file():
+            roots.append(search_html.parent)
+
+    if not roots:
+        fail(f"No generated search roots were found under {output_dir}")
+
+    return roots
+
+
+def check_search_html(search_root):
+    """Verify the generated search page wiring and DOM anchors."""
+
+    search_html_path = search_root / "search.html"
+    ensure_file(search_html_path, "generated search page")
+    search_html = read_text(search_html_path)
+
+    script_markers = (
+        "_static/language_data.js",
+        "_static/kernel-search.js",
+        "searchindex.js",
+    )
+    positions = []
+    for marker in script_markers:
+        position = search_html.find(marker)
+        if position < 0:
+            fail(f"search.html is missing required script reference: {marker}")
+        positions.append(position)
+
+    if positions != sorted(positions):
+        fail("search.html does not keep the expected search script load order")
+
+    for required_id in REQUIRED_SEARCH_IDS:
+        if required_id not in search_html:
+            fail(f"search.html is missing required advanced-search markup: {required_id}")
+
+
+def check_search_assets(search_root):
+    """Verify generated search artifacts and copied static assets."""
+
+    ensure_file(search_root / "searchindex.js", "generated search index")
+    ensure_file(search_root / "_static" / "language_data.js", "generated language data")
+
+    built_kernel_search = search_root / "_static" / "kernel-search.js"
+    source_kernel_search = SRCTREE / "Documentation" / "sphinx-static" / "kernel-search.js"
+    ensure_file(built_kernel_search, "generated kernel-search runtime")
+
+    built_runtime = read_text(built_kernel_search)
+    source_runtime = read_text(source_kernel_search)
+
+    if built_runtime != source_runtime:
+        fail(f"Generated kernel-search.js does not match the source asset: {built_kernel_search}")
+
+    # Keep the smoke test aligned with the hardening contract that the
+    # runtime now relies on: bounded summary loading, visible summary
+    # states, and the highlight-term wiring needed for summary generation.
+    for snippet in REQUIRED_RUNTIME_SNIPPETS:
+        if snippet not in built_runtime:
+            fail(f"kernel-search.js is missing required runtime snippet: {snippet}")
+
+
+def check_search_index_contract(search_root):
+    """Verify that generated searchindex.js exposes the runtime keys we use."""
+
+    search_index_path = search_root / "searchindex.js"
+    search_index = read_text(search_index_path)
+
+    if "Search.setIndex(" not in search_index:
+        fail("searchindex.js does not initialize the shared Search index")
+
+    for key in REQUIRED_SEARCH_INDEX_KEYS:
+        if not re.search(rf'(?:"{re.escape(key)}"|{re.escape(key)})\s*:', search_index):
+            fail(f"searchindex.js is missing required key: {key}")
+
+    # Older supported Sphinx versions omit these keys, and the runtime falls
+    # back to empty objects when they are absent.
+    for key in OPTIONAL_SEARCH_INDEX_KEYS:
+        if key in search_index and not re.search(
+            rf'(?:"{re.escape(key)}"|{re.escape(key)})\s*:', search_index
+        ):
+            fail(f"searchindex.js contains malformed optional key: {key}")
+
+
+def check_advanced_search_link(search_root):
+    """Verify that a built non-search page exposes the advanced-search link."""
+
+    for page in sorted(search_root.rglob("*.html")):
+        if page.name in {"search.html", "genindex.html"}:
+            continue
+
+        contents = read_text(page)
+        if "Advanced search" in contents and "?advanced=1" in contents:
+            return
+
+    fail("No generated documentation page exposes the Advanced search sidebar link")
+
+
+def main():
+    """Build docs and run the advanced-search smoke checks."""
+
+    args = parse_args()
+    build_dir, cleanup = prepare_build_dir(args)
+
+    try:
+        output_dir = run_build(args, build_dir)
+        search_roots = find_search_roots(output_dir)
+        for search_root in search_roots:
+            check_search_html(search_root)
+            check_search_assets(search_root)
+            check_search_index_contract(search_root)
+            check_advanced_search_link(search_root)
+    except Exception:
+        print(f"Preserving build directory for inspection: {build_dir}", file=sys.stderr)
+        cleanup = False
+        raise
+    finally:
+        if cleanup:
+            shutil.rmtree(build_dir)
+
+    print(
+        "Advanced search smoke test passed "
+        f"for SPHINXDIRS={' '.join(args.sphinxdirs)} "
+        f"across {len(search_roots)} generated search trees."
+    )
+    if cleanup:
+        print(f"Removed temporary build directory: {build_dir}")
+    else:
+        print(f"Build directory: {build_dir}")
+
+
+if __name__ == "__main__":
+    try:
+        main()
+    except (AssertionError, subprocess.CalledProcessError) as exc:
+        print(exc, file=sys.stderr)
+        sys.exit(1)
-- 
2.51.0
