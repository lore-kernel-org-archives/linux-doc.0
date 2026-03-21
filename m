Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E10634F481;
	Sat, 21 Mar 2026 18:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774116931; cv=pass; b=sxYWfw9QQaT28ruZDT/4EgSgWvp6KLUj0IFm53muhxSB41ulggkSTTpXzuPZvBsY6JiMNgPT97VTq9C2ACpXbdAgvqtxq6w8D2Nj4t7/FxxjHXfZXLL/i2J2gsUdupIEiolNGmuG7xXpM5O/LOEPmz2GjhXag3f+/j8vUKNoLks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774116931; c=relaxed/simple;
	bh=EW0sfpgaSZYrjO2qI3aw6cuFWY7lvakVyHVn1PwK9i8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=orSXrkTLYw2hcehehs2YPjO/G+RwE8pTJiY4FiRJX3KWcn2HwTubj5biQdyRi8zUvcFKInZWQJyzr5zvK675uT969ngzoCaQJ288fEEaOL4WTjxG7jv74FEHQmkuVwjUVDKo93+5/1VJ/2icpInePkPob1TEcN7/1fSzLXIt2l4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=LIvrGfJh; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="LIvrGfJh"
ARC-Seal: i=1; a=rsa-sha256; t=1774116917; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h/hAwRiEbQMvlb5k/t8Ga1aKT1t85O/NOoO+5js7MiJCxXheHtDrOno5SfY5vTIkjYdGkTqJqPdDHV//r39l/jYxq1CSQGN/XjpMo5yIeY+gOb8Ebo6kASBR/5Gj2ghTElJjZkafEujo/SH4A89/Fv5puRtOtmr/mkjXTOZde5I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774116917; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=35zXvDxlKoodTHyT9M+lAihJj87qPnPaB/zC36N8OHo=; 
	b=BfRx6y6479Q597lpC4OBqX0DmMjRncVIsoDrqM6YwcDnLYKH7nkp4nLUJKofoju4Yfx+9sGQKH4D5ihM3AXQ6nE9XY6MlKpvKQgabfksPbOqAMpfx8aStTykRAmVHMD/jyLwOhY+WMccW7ljSK0Re0ycvvJ14+Yoxg3L1Lahlpg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774116917;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=35zXvDxlKoodTHyT9M+lAihJj87qPnPaB/zC36N8OHo=;
	b=LIvrGfJhO6Wn296r6zaA7T4rFmniZqcACULCJBp0V2vfmuViFCtB0axbelW6+mwf
	8HBihr5qkWZ02Wd9WypCnHGhHKR4Srq2ladZbvlNXlaKsq4j1UA1My0StnDUHCJBfFl
	wlJuB2SanzRegOWe471H1XC2sgCXI938rd8CQYRw=
Received: by mx.zohomail.com with SMTPS id 1774116915674816.1119254526734;
	Sat, 21 Mar 2026 11:15:15 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH] docs: add advanced search for kernel documentation
Date: Sat, 21 Mar 2026 14:15:11 -0400
Message-ID: <20260321181511.11706-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Replace the stock Sphinx search page with one that reuses the
existing searchindex.js while adding structured result grouping,
filtering, and exact identifier matching.

Results are grouped into Symbols, Sections, Index entries, and
Pages, each in a collapsible section with a count. An Advanced
panel exposes filters for documentation area, object type, result
kind, and exact match mode. All state is URL-encoded so searches
remain shareable.

Page summary snippets are lazy-loaded via IntersectionObserver to
avoid fetching every matching page up front.

The sidebar keeps the existing quick-search box and adds an
"Advanced search" link below it.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
---
 Documentation/sphinx-static/custom.css        | 163 ++++
 Documentation/sphinx-static/kernel-search.js  | 746 ++++++++++++++++++
 Documentation/sphinx/templates/search.html    | 106 +++
 Documentation/sphinx/templates/searchbox.html |  18 +
 4 files changed, 1033 insertions(+)
 create mode 100644 Documentation/sphinx-static/kernel-search.js
 create mode 100644 Documentation/sphinx/templates/search.html
 create mode 100644 Documentation/sphinx/templates/searchbox.html

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index db24f4344..dd7cc221e 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -169,3 +169,166 @@ a.manpage {
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
+div.kernel-search-results {
+    margin-top: 1.5em;
+}
+
+p.kernel-search-status {
+    margin-bottom: 1.5em;
+}
+
+details.kernel-search-group {
+    margin-top: 2em;
+}
+
+summary.kernel-search-group-summary {
+    cursor: pointer;
+    font-size: 150%;
+    margin: 0 0 0.6em 0;
+}
+
+summary.kernel-search-group-summary h2.kernel-search-group-title {
+    display: inline;
+    margin: 0;
+    font-size: inherit;
+    font-weight: normal;
+}
+
+span.kernel-search-group-count {
+    color: #666666;
+    margin-left: 0.35em;
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
index 000000000..bcf79f820
--- /dev/null
+++ b/Documentation/sphinx-static/kernel-search.js
@@ -0,0 +1,746 @@
+"use strict";
+
+(() => {
+  const RESULT_KIND_ORDER = ["object", "title", "index", "text"];
+  const RESULT_KIND_LABELS = {
+    object: "Symbols",
+    title: "Sections",
+    index: "Index entries",
+    text: "Pages",
+  };
+  const TOP_LEVEL_AREA = "__top_level__";
+  const OBJECT_PRIORITY = {
+    0: 15,
+    1: 5,
+    2: -5,
+  };
+  const SUMMARY_ROOT_MARGIN = "300px 0px";
+  const documentTextCache = new Map();
+  const summaryTargets = new WeakMap();
+  let summaryObserver = null;
+
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
+  const splitQuery = (query) =>
+    query
+      .split(/[^\p{Letter}\p{Number}_\p{Emoji_Presentation}]+/gu)
+      .filter((term) => term);
+
+  const getStemmer = () =>
+    typeof Stemmer === "function" ? new Stemmer() : { stemWord: (word) => word };
+
+  const hasOwn = (object, key) =>
+    Object.prototype.hasOwnProperty.call(object, key);
+
+  const getContentRoot = () =>
+    document.documentElement.dataset.content_root
+    || (typeof DOCUMENTATION_OPTIONS !== "undefined" ? DOCUMENTATION_OPTIONS.URL_ROOT || "" : "");
+
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
+  const loadDocumentText = (requestUrl) => {
+    if (!documentTextCache.has(requestUrl)) {
+      documentTextCache.set(
+        requestUrl,
+        fetch(requestUrl)
+          .then((response) => (response.ok ? response.text() : ""))
+          .catch(() => ""),
+      );
+    }
+
+    return documentTextCache.get(requestUrl);
+  };
+
+  const pushBest = (resultMap, result) => {
+    const key = [result.kind, result.docName, result.anchor || "", result.title].join("|");
+    const existing = resultMap.get(key);
+    if (!existing || existing.score < result.score) resultMap.set(key, result);
+  };
+
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
+        if ((typeof stopwords !== "undefined" && stopwords.has(lowered)) || /^\d+$/.test(term)) {
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
+    if (state.exact) return baseScore + 20;
+    if (candidateLower === state.queryLower) return baseScore + 10;
+    if (candidateLower.includes(state.queryLower)) {
+      return Math.max(partialScore, Math.round((baseScore * state.queryLower.length) / candidateLower.length));
+    }
+
+    return partialScore * Math.max(1, state.rawTerms.filter((term) => candidateLower.includes(term)).length);
+  };
+
+  const collectObjectResults = (index, state, filters) => {
+    const resultMap = new Map();
+    const objects = index.objects || {};
+    const objNames = index.objnames || {};
+    const objTypes = index.objtypes || {};
+
+    Object.keys(objects).forEach((prefix) => {
+      objects[prefix].forEach((match) => {
+        const fileIndex = match[0];
+        const typeIndex = match[1];
+        const priority = match[2];
+        const anchorValue = match[3];
+        const name = match[4];
+        const docName = index.docnames[fileIndex];
+        const fileName = index.filenames[fileIndex];
+        const pageTitle = index.titles[fileIndex];
+        const objectLabel = objNames[typeIndex] ? objNames[typeIndex][2] : "Object";
+        const objectType = objTypes[typeIndex];
+
+        if (!matchArea(docName, filters.area)) return;
+        if (filters.objtype && filters.objtype !== objectType) return;
+
+        const fullName = prefix ? prefix + "." + name : name;
+        const fullNameLower = fullName.toLowerCase();
+        const lastNameLower = fullNameLower.split(".").slice(-1)[0];
+        const nameLower = name.toLowerCase();
+
+        let score = 0;
+        if (state.exact) {
+          if (
+            fullNameLower !== state.queryLower
+            && lastNameLower !== state.queryLower
+            && nameLower !== state.queryLower
+          ) {
+            return;
+          }
+          score = 120;
+        } else {
+          const haystack = `${fullName} ${objectLabel} ${pageTitle}`.toLowerCase();
+          if (state.objectTerms.size === 0) return;
+          if ([...state.objectTerms].some((term) => !haystack.includes(term))) return;
+          const matchedNameTerms = state.rawTerms.filter(
+            (term) =>
+              fullNameLower.includes(term)
+              || lastNameLower.includes(term)
+              || nameLower.includes(term),
+          ).length;
+
+          if (
+            fullNameLower === state.queryLower
+            || lastNameLower === state.queryLower
+            || nameLower === state.queryLower
+          ) {
+            score += 11;
+          } else if (
+            lastNameLower.includes(state.queryLower)
+            || nameLower.includes(state.queryLower)
+          ) {
+            score += 6;
+          } else if (fullNameLower.includes(state.queryLower)) {
+            score += 4;
+          } else if (matchedNameTerms > 0) {
+            score += matchedNameTerms;
+          } else {
+            return;
+          }
+        }
+
+        score += OBJECT_PRIORITY[priority] || 0;
+
+        let anchor = anchorValue;
+        if (anchor === "") anchor = fullName;
+        else if (anchor === "-" && objNames[typeIndex]) anchor = objNames[typeIndex][1] + "-" + fullName;
+
+        pushBest(resultMap, {
+          kind: "object",
+          docName,
+          fileName,
+          title: fullName,
+          anchor: anchor ? "#" + anchor : "",
+          description: `${objectLabel}, in ${pageTitle}`,
+          score,
+        });
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
+          score: scoreLabelMatch(lowered, state, 15, 7),
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
+        let score = scoreLabelMatch(lowered, state, 20, 8);
+        if (!isMain) score -= 5;
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
+          score: 5,
+        },
+        {
+          files: hasOwn(titleTerms, word) ? titleTerms[word] : undefined,
+          score: 15,
+        },
+      ];
+
+      if (!state.exact && word.length > 2) {
+        if (!hasOwn(terms, word)) {
+          Object.keys(terms).forEach((term) => {
+            if (term.includes(word)) candidates.push({ files: terms[term], score: 2 });
+          });
+        }
+        if (!hasOwn(titleTerms, word)) {
+          Object.keys(titleTerms).forEach((term) => {
+            if (term.includes(word)) candidates.push({ files: titleTerms[term], score: 7 });
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
+      if (state.exact && index.titles[fileIndex].toLowerCase() === state.queryLower) score += 10;
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
+  const ensureSummaryObserver = () => {
+    if (summaryObserver || typeof IntersectionObserver !== "function") return summaryObserver;
+
+    summaryObserver = new IntersectionObserver((entries) => {
+      entries.forEach((entry) => {
+        if (!entry.isIntersecting) return;
+
+        const target = entry.target;
+        summaryObserver.unobserve(target);
+        const payload = summaryTargets.get(target);
+        if (!payload || payload.loaded) return;
+
+        payload.loaded = true;
+        loadDocumentText(payload.requestUrl).then((htmlText) => {
+          if (!htmlText) return;
+
+          const summary = makeSummary(htmlText, payload.keywords, payload.anchor);
+          if (!summary) return;
+
+          payload.item.appendChild(summary);
+        });
+      });
+    }, { rootMargin: SUMMARY_ROOT_MARGIN });
+
+    return summaryObserver;
+  };
+
+  const queueSummaryLoad = (result, item, keywords) => {
+    const urls = buildDocUrls(result.docName);
+    const payload = {
+      anchor: result.anchor,
+      item,
+      keywords,
+      loaded: false,
+      requestUrl: urls.requestUrl,
+    };
+
+    const observer = ensureSummaryObserver();
+    if (!observer) {
+      payload.loaded = true;
+      loadDocumentText(payload.requestUrl).then((htmlText) => {
+        if (!htmlText) return;
+
+        const summary = makeSummary(htmlText, keywords, result.anchor);
+        if (summary) item.appendChild(summary);
+      });
+      return;
+    }
+
+    summaryTargets.set(item, payload);
+    observer.observe(item);
+  };
+
+  const createResultItem = (result, keywords) => {
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
+      queueSummaryLoad(result, item, keywords);
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
+    if (summaryObserver) {
+      summaryObserver.disconnect();
+      summaryObserver = null;
+    }
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
+    RESULT_KIND_ORDER.forEach((kind) => {
+      const results = resultsByKind[kind];
+      if (!results.length) return;
+
+      const group = container.appendChild(document.createElement("details"));
+      group.className = `kernel-search-group kind-${kind}`;
+      group.open = true;
+
+      const summary = group.appendChild(document.createElement("summary"));
+      summary.className = "kernel-search-group-summary";
+
+      const heading = summary.appendChild(document.createElement("h2"));
+      heading.className = "kernel-search-group-title";
+      heading.textContent = RESULT_KIND_LABELS[kind];
+
+      const count = summary.appendChild(document.createElement("span"));
+      count.className = "kernel-search-group-count";
+      count.textContent = `(${results.length})`;
+
+      const list = group.appendChild(document.createElement("ol"));
+      list.className = "kernel-search-list";
+
+      results.forEach((result) => {
+        list.appendChild(createResultItem(result, state.highlightTerms));
+      });
+    });
+  };
+
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
+    const filters = buildFilters(baseState);
+    const resultsByKind = {
+      object: [],
+      title: [],
+      index: [],
+      text: [],
+    };
+
+    if (!baseState.queryLower) {
+      renderResults(baseState, resultsByKind);
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
+    renderResults(baseState, resultsByKind);
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
index 000000000..966740c12
--- /dev/null
+++ b/Documentation/sphinx/templates/search.html
@@ -0,0 +1,106 @@
+{# SPDX-License-Identifier: GPL-2.0 #}
+
+{# Enhanced search page for kernel documentation. #}
+{%- extends "layout.html" %}
+{% set title = _('Search') %}
+{%- block scripts %}
+    {{ super() }}
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
index 000000000..6caa0498a
--- /dev/null
+++ b/Documentation/sphinx/templates/searchbox.html
@@ -0,0 +1,18 @@
+{# SPDX-License-Identifier: GPL-2.0 #}
+
+{# Sphinx sidebar template: quick search box plus advanced search link. #}
+{%- if pagename != "search" and builder != "singlehtml" %}
+<search id="searchbox" style="display: none" role="search">
+  <h3 id="searchlabel">{{ _('Quick search') }}</h3>
+    <div class="searchformwrapper">
+    <form class="search" action="{{ pathto('search') }}" method="get">
+      <input type="text" name="q" aria-labelledby="searchlabel" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false"/>
+      <input type="submit" value="{{ _('Go') }}" />
+    </form>
+    </div>
+    <p class="search-advanced-link">
+      <a href="{{ pathto('search') }}?advanced=1">{{ _('Advanced search') }}</a>
+    </p>
+</search>
+<script>document.getElementById('searchbox').style.display = "block"</script>
+{%- endif %}
-- 
2.51.0

