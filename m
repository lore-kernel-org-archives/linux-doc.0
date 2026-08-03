Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6137E395AC6;
	Mon,  3 Aug 2026 06:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738124; cv=none; b=pMop3XoP3AmWvEh9blf0Ua0mWYQO97G/OXq4rg62rBihTJ4pwAmMDD5QgWDbsjRRBFceQK25h5A6Pa7DX/sX+jb+UE3T4VH6OVE0XCcygMn1gN/hSPx1AyvZxSzY/ggNByU5+I+iCduLWVppsihEp3E7ccclte4x1bZ/b6tCb8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738124; c=relaxed/simple;
	bh=xRGBANW9bcYijvcSkfg5CGZTCw4yo15w6eJPXxAvOAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NLieABh9y+hLDKJDmTJDhVppwL1ZEpIC/URzbj7ce/WJ31KTum/qhksec0g70R5z1j+pXCKeGDmAXADRu4YL1Ikv0bFz4bOYIDRq7J58QOHR0Nclrn5L3DXbDsO9KPWXLfdY0yI8KG7/JyKuS07TCawbAiwve4U5Fw1kSPM1CfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KCU29XDw; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KCU29XDw"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785738120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3uU5YwZr2W4zWFkp8ifsuxS5rKiKev6qcptuc9TGJzI=;
	b=KCU29XDwBtUUAwWlG8F2bF0vUhkzQLVh1r7/SIjTAQB86VLoaMs9Gs/wUcftwof0gk2dpr
	NyX9z0nwLSXzZ8myut6o/X/6soTDQMbeGd/Jw9CSSbR/o4DKxGgdUjjaWrKbjMxyOO6Mza
	zVCOf3Vt3LRp+NVF3BadXueg2vEXsuc=
From: Ye Liu <ye.liu@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Ye Liu <liuye@kylinos.cn>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] tools/mm/page_owner_sort: add module name sort/cull/filter support
Date: Mon,  3 Aug 2026 14:20:55 +0800
Message-Id: <20260803062056.1518070-3-ye.liu@linux.dev>
In-Reply-To: <20260803062056.1518070-1-ye.liu@linux.dev>
References: <20260803062056.1518070-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

Page owner stack traces already contain kernel module names in the
"function+0xNN/0xNN [module]" format produced by %pS, but page_owner_sort
has no way to sort, cull, or filter by module.

Extract the first module name from each record's stack trace using an
anchored regex that matches the stack trace frame format
"+0x[0-9a-f]+/0x[0-9a-f]+\\s*\\[([a-zA-Z0-9_-]+)\\]".

The regex is anchored to the stack trace frame to avoid false matches on
kernel thread comm names such as [khugepaged] that appear in the record
header.  The character class includes '-' so modules with hyphens
(e.g. aa-bb-cc) are correctly matched.

Records whose stack traces contain no module frames are assigned "vmlinux".

New options:
  -M                  Sort by module name
  --sort=mod          Sort by module name (supports +/- prefix)
  --cull=mod          Cull (aggregate) by module name
  --module <modlist>  Filter to records matching the given module(s)

The module field is also printed in cull output when relevant.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 Documentation/mm/page_owner.rst |   8 ++-
 tools/mm/page_owner_sort.c      | 122 +++++++++++++++++++++++++++-----
 2 files changed, 110 insertions(+), 20 deletions(-)

diff --git a/Documentation/mm/page_owner.rst b/Documentation/mm/page_owner.rst
index a6bd3fe6423a..bd027377dff6 100644
--- a/Documentation/mm/page_owner.rst
+++ b/Documentation/mm/page_owner.rst
@@ -199,6 +199,7 @@ Usage
 		-p		Sort by pid.
 		-P		Sort by tgid.
 		-n		Sort by task command name.
+		-M		Sort by module name.
 		-r		Sort by memory release time.
 		-s		Sort by stack trace.
 		-t		Sort by times (default).
@@ -240,8 +241,10 @@ Usage
 					group ID numbers appear in <tgidlist>.
 		--name <cmdlist>	Select by task command name. This selects the blocks whose
 					task command name appear in <cmdlist>.
+		--module <modlist>	Select by module name. This selects the blocks whose
+					module name appear in <modlist>.
 
-		<pidlist>, <tgidlist>, <cmdlist> are single arguments in the form of a comma-separated list,
+		<pidlist>, <tgidlist>, <cmdlist>, <modlist> are single arguments in the form of a comma-separated list,
 		which offers a way to specify individual selecting rules.
 
 
@@ -249,6 +252,7 @@ Usage
 				./page_owner_sort <input> <output> --pid=1
 				./page_owner_sort <input> <output> --tgid=1,2,3
 				./page_owner_sort <input> <output> --name name1,name2
+				./page_owner_sort <input> <output> --module xfs,ext4
 
 STANDARD FORMAT SPECIFIERS
 ==========================
@@ -265,6 +269,7 @@ STANDARD FORMAT SPECIFIERS
 	ft		free_ts		timestamp of the page when it was released
 	at		alloc_ts	timestamp of the page when it was allocated
 	ator		allocator	memory allocator for pages
+	mod		module		kernel module name
 
   For --cull option:
 
@@ -275,6 +280,7 @@ STANDARD FORMAT SPECIFIERS
 	f		free		whether the page has been released or not
 	st		stacktrace	stack trace of the page allocation
 	ator		allocator	memory allocator for pages
+	mod		module		kernel module name
 
 Filtering page_owner output
 ============================
diff --git a/tools/mm/page_owner_sort.c b/tools/mm/page_owner_sort.c
index 3c86c8d0618c..70d1c76561e8 100644
--- a/tools/mm/page_owner_sort.c
+++ b/tools/mm/page_owner_sort.c
@@ -25,11 +25,13 @@
 #include <getopt.h>
 
 #define TASK_COMM_LEN 16
+#define MODULE_NAME_LEN 64
 
 struct block_list {
 	char *txt;
 	char *comm; // task command name
 	char *stacktrace;
+	char *module; // kernel module name
 	__u64 ts_nsec;
 	int len;
 	int num;
@@ -41,7 +43,8 @@ struct block_list {
 enum FILTER_BIT {
 	FILTER_PID = 1<<1,
 	FILTER_TGID = 1<<2,
-	FILTER_COMM = 1<<3
+	FILTER_COMM = 1<<3,
+	FILTER_MODULE = 1<<4
 };
 
 enum FILTER_RESULT {
@@ -55,7 +58,8 @@ enum CULL_BIT {
 	CULL_TGID = 1<<2,
 	CULL_COMM = 1<<3,
 	CULL_STACKTRACE = 1<<4,
-	CULL_ALLOCATOR = 1<<5
+	CULL_ALLOCATOR = 1<<5,
+	CULL_MODULE = 1<<6
 };
 enum ALLOCATOR_BIT {
 	ALLOCATOR_CMA = 1<<1,
@@ -65,7 +69,8 @@ enum ALLOCATOR_BIT {
 };
 enum ARG_TYPE {
 	ARG_TXT, ARG_COMM, ARG_STACKTRACE, ARG_ALLOC_TS, ARG_CULL_TIME,
-	ARG_PAGE_NUM, ARG_PID, ARG_TGID, ARG_UNKNOWN, ARG_ALLOCATOR
+	ARG_PAGE_NUM, ARG_PID, ARG_TGID, ARG_UNKNOWN, ARG_ALLOCATOR,
+	ARG_MODULE
 };
 enum SORT_ORDER {
 	SORT_ASC = 1,
@@ -79,15 +84,18 @@ enum COMP_FLAG {
 	COMP_STACK = 1<<3,
 	COMP_NUM = 1<<4,
 	COMP_TGID = 1<<5,
-	COMP_COMM = 1<<6
+	COMP_COMM = 1<<6,
+	COMP_MODULE = 1<<7
 };
 struct filter_condition {
 	pid_t *pids;
 	pid_t *tgids;
 	char **comms;
+	char **modules;
 	int pids_size;
 	int tgids_size;
 	int comms_size;
+	int modules_size;
 };
 struct sort_condition {
 	int (**cmps)(const void *, const void *);
@@ -101,6 +109,7 @@ static regex_t pid_pattern;
 static regex_t tgid_pattern;
 static regex_t comm_pattern;
 static regex_t ts_nsec_pattern;
+static regex_t module_pattern;
 static struct block_list *list;
 static int list_size;
 static int max_size;
@@ -184,6 +193,13 @@ static int compare_comm(const void *p1, const void *p2)
 	return strcmp(l1->comm, l2->comm);
 }
 
+static int compare_module(const void *p1, const void *p2)
+{
+	const struct block_list *l1 = p1, *l2 = p2;
+
+	return strcmp(l1->module, l2->module);
+}
+
 static int compare_ts(const void *p1, const void *p2)
 {
 	const struct block_list *l1 = p1, *l2 = p2;
@@ -207,6 +223,8 @@ static int compare_cull_condition(const void *p1, const void *p2)
 		return compare_tgid(p1, p2);
 	if ((cull & CULL_COMM) && compare_comm(p1, p2))
 		return compare_comm(p1, p2);
+	if ((cull & CULL_MODULE) && compare_module(p1, p2))
+		return compare_module(p1, p2);
 	if ((cull & CULL_ALLOCATOR) && compare_allocator(p1, p2))
 		return compare_allocator(p1, p2);
 	return 0;
@@ -411,9 +429,33 @@ static char *get_comm(char *buf)
 	return comm_str;
 }
 
+static char *get_module(char *buf)
+{
+	char *module_str = malloc(MODULE_NAME_LEN);
+	regmatch_t pmatch[2];
+	int val_len;
+
+	if (!module_str)
+		return NULL;
+	memset(module_str, 0, MODULE_NAME_LEN);
+	if (regexec(&module_pattern, buf, 2, pmatch, REG_NOTBOL) != 0 || pmatch[1].rm_so == -1) {
+		strcpy(module_str, "vmlinux");
+		return module_str;
+	}
+
+	val_len = pmatch[1].rm_eo - pmatch[1].rm_so;
+	if ((size_t)val_len >= MODULE_NAME_LEN)
+		val_len = MODULE_NAME_LEN - 1;
+	memcpy(module_str, buf + pmatch[1].rm_so, val_len);
+	module_str[val_len] = '\0';
+
+	return module_str;
+}
+
 static void free_block_list(struct block_list *block)
 {
 	free(block->comm);
+	free(block->module);
 	free(block->txt);
 }
 
@@ -433,6 +475,8 @@ static int get_arg_type(const char *arg)
 		return ARG_ALLOC_TS;
 	else if (!strcmp(arg, "allocator") || !strcmp(arg, "ator"))
 		return ARG_ALLOCATOR;
+	else if (!strcmp(arg, "module") || !strcmp(arg, "mod"))
+		return ARG_MODULE;
 	else {
 		return ARG_UNKNOWN;
 	}
@@ -483,25 +527,36 @@ static bool match_str_list(const char *str, char **list, int list_size)
 
 static enum FILTER_RESULT filter_record(char *buf)
 {
-	char *comm;
+	char *comm, *module;
 
 	if ((filter & FILTER_PID) && !match_num_list(get_pid(buf), fc.pids, fc.pids_size))
 		return FILTER_SKIP;
 	if ((filter & FILTER_TGID) &&
 		!match_num_list(get_tgid(buf), fc.tgids, fc.tgids_size))
 		return FILTER_SKIP;
-	if (!(filter & FILTER_COMM))
+	if (!(filter & (FILTER_COMM | FILTER_MODULE)))
 		return FILTER_MATCH;
 
-	comm = get_comm(buf);
-	if (!comm)
-		return FILTER_ERROR;
-
-	if (!match_str_list(comm, fc.comms, fc.comms_size)) {
+	if (filter & FILTER_COMM) {
+		comm = get_comm(buf);
+		if (!comm)
+			return FILTER_ERROR;
+		if (!match_str_list(comm, fc.comms, fc.comms_size)) {
+			free(comm);
+			return FILTER_SKIP;
+		}
 		free(comm);
-		return FILTER_SKIP;
 	}
-	free(comm);
+	if (filter & FILTER_MODULE) {
+		module = get_module(buf);
+		if (!module)
+			return FILTER_ERROR;
+		if (!match_str_list(module, fc.modules, fc.modules_size)) {
+			free(module);
+			return FILTER_SKIP;
+		}
+		free(module);
+	}
 	return FILTER_MATCH;
 }
 
@@ -547,6 +602,12 @@ static bool add_list(char *buf, int len, char *ext_buf)
 		list[list_size].stacktrace++;
 	list[list_size].ts_nsec = get_ts_nsec(buf);
 	list[list_size].allocator = get_allocator(buf, ext_buf);
+	list[list_size].module = get_module(buf);
+	if (!list[list_size].module) {
+		fprintf(stderr, "Out of memory\n");
+		free_block_list(&list[list_size]);
+		return false;
+	}
 	list_size++;
 	if (list_size % 1000 == 0) {
 		printf("loaded %d\r", list_size);
@@ -573,6 +634,8 @@ static bool parse_cull_args(const char *arg_str)
 			cull |= CULL_STACKTRACE;
 		else if (arg_type == ARG_ALLOCATOR)
 			cull |= CULL_ALLOCATOR;
+		else if (arg_type == ARG_MODULE)
+			cull |= CULL_MODULE;
 		else {
 			free_explode(args, size);
 			return false;
@@ -635,6 +698,8 @@ static bool parse_sort_args(const char *arg_str)
 			sc.cmps[i] = compare_txt;
 		else if (arg_type == ARG_ALLOCATOR)
 			sc.cmps[i] = compare_allocator;
+		else if (arg_type == ARG_MODULE)
+			sc.cmps[i] = compare_module;
 		else {
 			free_explode(args, size);
 			sc.size = 0;
@@ -691,7 +756,8 @@ static void usage(void)
 		"-p\t\t\tSort by pid.\n"
 		"-P\t\t\tSort by tgid.\n"
 		"-s\t\t\tSort by the stacktrace.\n"
-		"-t\t\t\tSort by number of times record is seen (default).\n\n"
+		"-t\t\t\tSort by number of times record is seen (default).\n"
+		"-M\t\t\tSort by module name.\n\n"
 		"--pid <pidlist>\t\tSelect by pid. This selects the information"
 		" of\n\t\t\tblocks whose process ID numbers appear in <pidlist>.\n"
 		"--tgid <tgidlist>\tSelect by tgid. This selects the information"
@@ -700,10 +766,11 @@ static void usage(void)
 		"--name <cmdlist>\tSelect by command name. This selects the"
 		" information\n\t\t\tof blocks whose command name appears in"
 		" <cmdlist>.\n"
-		"--cull <rules>\t\tCull by user-defined rules. <rules> is a "
-		"single\n\t\t\targument in the form of a comma-separated list "
-		"with some\n\t\t\tcommon fields predefined (pid, tgid, comm, "
-		"stacktrace, allocator)\n"
+		"--module <modlist>\tSelect by module name. This selects the information\n"
+		"\t\t\tof blocks whose module name appears in <modlist>.\n"
+		"--cull <rules>\t\tCull by user-defined rules. <rules> is a single\n"
+		"\t\t\targument in the form of a comma-separated list with some\n"
+		"\t\t\tcommon fields predefined (pid, tgid, comm, stacktrace, allocator, module)\n"
 		"--sort <order>\t\tSpecify sort order as: [+|-]key[,[+|-]key[,...]]\n"
 	);
 }
@@ -721,13 +788,14 @@ int main(int argc, char **argv)
 		{ "name", required_argument, NULL, 3 },
 		{ "cull", required_argument, NULL, 4 },
 		{ "sort", required_argument, NULL, 5 },
+		{ "module", required_argument, NULL, 6 },
 		{ "help", no_argument, NULL, 'h' },
 		{ 0, 0, 0, 0},
 	};
 
 	compare_flag = COMP_NO_FLAG;
 
-	while ((opt = getopt_long(argc, argv, "admnpstPh", longopts, NULL)) != -1)
+	while ((opt = getopt_long(argc, argv, "admnpstPMh", longopts, NULL)) != -1)
 		switch (opt) {
 		case 'a':
 			compare_flag |= COMP_ALLOC;
@@ -753,6 +821,9 @@ int main(int argc, char **argv)
 		case 'n':
 			compare_flag |= COMP_COMM;
 			break;
+		case 'M':
+			compare_flag |= COMP_MODULE;
+			break;
 		case 'h':
 			usage();
 			exit(0);
@@ -792,6 +863,10 @@ int main(int argc, char **argv)
 				exit(1);
 			}
 			break;
+		case 6:
+			filter = filter | FILTER_MODULE;
+			fc.modules = explode(',', optarg, &fc.modules_size);
+			break;
 		default:
 			usage();
 			exit(1);
@@ -834,6 +909,9 @@ int main(int argc, char **argv)
 	case COMP_COMM:
 		set_single_cmp(compare_comm, SORT_ASC);
 		break;
+	case COMP_MODULE:
+		set_single_cmp(compare_module, SORT_ASC);
+		break;
 	default:
 		usage();
 		exit(1);
@@ -857,6 +935,8 @@ int main(int argc, char **argv)
 		goto out_comm;
 	if (!check_regcomp(&ts_nsec_pattern, "ts\\s*([0-9]*)\\s*ns"))
 		goto out_ts;
+	if (!check_regcomp(&module_pattern, "\\+0x[0-9a-f]+/0x[0-9a-f]+\\s*\\[([a-zA-Z0-9_-]+)\\]"))
+		goto out_module;
 
 	fstat(fileno(fin), &st);
 	max_size = st.st_size / 100; /* hack ... */
@@ -915,6 +995,8 @@ int main(int argc, char **argv)
 				fprintf(fout, ", TGID %d", list[i].tgid);
 			if (cull & CULL_COMM || filter & FILTER_COMM)
 				fprintf(fout, ", task_comm_name: %s", list[i].comm);
+			if (cull & CULL_MODULE || filter & FILTER_MODULE)
+				fprintf(fout, ", module: %s", list[i].module);
 			if (cull & CULL_ALLOCATOR) {
 				fprintf(fout, ", ");
 				print_allocator(fout, list[i].allocator);
@@ -935,6 +1017,8 @@ int main(int argc, char **argv)
 			free_block_list(&list[i]);
 		free(list);
 	}
+out_module:
+	regfree(&module_pattern);
 out_ts:
 	regfree(&ts_nsec_pattern);
 out_comm:
-- 
2.25.1

