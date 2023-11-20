Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D394374
	for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 02:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/0Z/1/j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AFE6C433C8;
	Mon, 20 Nov 2023 02:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700448094;
	bh=UiWuaKeTiSFKQxVccuysbinvCkmLWJ1QXqtmU4c9M9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o/0Z/1/jlmTimJm9937305yEJETPIoA66Qdh+9bcGh4iO1jC7uwn5sAd36iHbSjfF
	 y5073eOz1lEnL5m3wFSz+1ILlybe2uy2Rr7g2ANq8FuQVZjZySqzgVBrnuTj55kuec
	 W/BBC+TgPpbkDkulF6xyej5O57aBSgYOqfSM8dL4QcR5dWPS3Ol+IfXsSKi2L3qPC8
	 slYmHD0Q0xTpui580WF/xxTH3hnDRteip0YpBaJ4l9c/EObCSkSXsUcMtvI4iMgYcO
	 rQEGHHyGoNic200lCdcB8PDVuKrs2sR1Ccje+ypBCoXPRrypbL+y3FwSgKbK9M5gr3
	 Wvs4axuOecFJw==
Date: Sun, 19 Nov 2023 18:41:32 -0800
From: Chris Li <chrisl@kernel.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Yosry Ahmed <yosryahmed@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, tj@kernel.org,
	lizefan.x@bytedance.com, Johannes Weiner <hannes@cmpxchg.org>,
	Domenico Cerasuolo <cerasuolodomenico@gmail.com>,
	Seth Jennings <sjenning@redhat.com>,
	Dan Streetman <ddstreet@ieee.org>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeelb@google.com>,
	Muchun Song <muchun.song@linux.dev>,
	Hugh Dickins <hughd@google.com>, corbet@lwn.net,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	senozhatsky@chromium.org, rppt@kernel.org,
	linux-mm <linux-mm@kvack.org>, kernel-team@meta.com,
	LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
	david@ixit.cz
Subject: Re: [PATCH v5] zswap: memcontrol: implement zswap writeback disabling
Message-ID: <ZVrHXJLxvs4_CUxc@google.com>
References: <20231115172344.4155593-1-nphamcs@gmail.com>
 <CAF8kJuN-4UE0skVHvjUzpGefavkLULMonjgkXUZSBVJrcGFXCA@mail.gmail.com>
 <CAJD7tkZ1U+YuvoBAnrXFxQDiQV2hXdbMG-gbzu64R8GLAtNAPA@mail.gmail.com>
 <CAF8kJuPTNwQM413UdeQTkMQ8HkJFyF4OWVrxJSf7uWbege0CXQ@mail.gmail.com>
 <CAKEwX=O5M-vZE5YhYQ5_CbCmXovS1XECO4ROXKWo06K880M1Mg@mail.gmail.com>
 <CAF8kJuOD6zq2VPcVdoZGvkzYX8iXn1akuYhNDJx-LUdS+Sx3GA@mail.gmail.com>
 <CAKEwX=NdFjemcmf27PVpgHpVHWQEo19KfApepWJBRYeyVCWvCw@mail.gmail.com>
 <CAF8kJuOCyd5r0LQ3m8fQp0GtxxNUKSmwURJH6V9aApefvX8xCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF8kJuOCyd5r0LQ3m8fQp0GtxxNUKSmwURJH6V9aApefvX8xCA@mail.gmail.com>

Hi Nhat,

On Sun, Nov 19, 2023 at 01:50:17PM -0800, Chris Li wrote:
> On Sun, Nov 19, 2023 at 11:08 AM Nhat Pham <nphamcs@gmail.com> wrote:
> > I don't have any major argument against this. It just seems a bit
> > heavyweight for what we need at the moment (only disabling
> > swap-to-disk usage).
> 
> The first milestone we just implement the reserved keywords without
> the custom swap tier list.
> That should be very similar to "zswap.writeback". Instead of writing 0
> to "zswap.writeback".
> You write "zswap" to "swap.tiers". Writing "none" will disable all
> swap. Writing "all" will allow all swap devices.
> I consider this conceptually cleaner than the "zswap.writeback" == 0
> will also disable other swap types behavior. "disabled zswap writeback
> == disable all swap" feels less natural.

I implement a minimal version of the "swap.tiers" to replace the "zswap.writeback".
It only implements the ABI level. Under the hook it is using the writeback bool.

This patch builds on top of your V5 patch.

implement memory.swap.tiers on top of memory.zswap.writeback.

"memory.swap.tiers" supports two key words for now:
all: all swap swap tiers are considered. (previously zswap.writback == 1)
zswap: only zswap tier are considered. (previously zswap.writeback == 0)

Index: linux/mm/memcontrol.c
===================================================================
--- linux.orig/mm/memcontrol.c
+++ linux/mm/memcontrol.c
@@ -7992,6 +7992,32 @@ static int swap_events_show(struct seq_f
 	return 0;
 }
 
+static int swap_tiers_show(struct seq_file *m, void *v)
+{
+	struct mem_cgroup *memcg = mem_cgroup_from_seq(m);
+
+	seq_printf(m, "%s\n", READ_ONCE(memcg->zswap_writeback) ? "all" : "zswap");
+	return 0;
+}
+
+static ssize_t swap_tiers_write(struct kernfs_open_file *of,
+				char *buf, size_t nbytes, loff_t off)
+{
+	struct mem_cgroup *memcg = mem_cgroup_from_css(of_css(of));
+	int zswap_writeback;
+
+	buf = strstrip(buf);
+	if (!strcmp(buf, "all"))
+		zswap_writeback = 1;
+	else if (!strcmp(buf, "zswap"))
+		zswap_writeback = 0;
+	else
+		return -EINVAL;
+
+	WRITE_ONCE(memcg->zswap_writeback, zswap_writeback);
+	return nbytes;
+}
+
 static struct cftype swap_files[] = {
 	{
 		.name = "swap.current",
@@ -8021,6 +8047,12 @@ static struct cftype swap_files[] = {
 		.file_offset = offsetof(struct mem_cgroup, swap_events_file),
 		.seq_show = swap_events_show,
 	},
+	{
+		.name = "swap.tiers",
+		.seq_show = swap_tiers_show,
+		.write = swap_tiers_write,
+	},
+
 	{ }	/* terminate */
 };
 
@@ -8183,31 +8215,6 @@ static ssize_t zswap_max_write(struct ke
 	return nbytes;
 }
 
-static int zswap_writeback_show(struct seq_file *m, void *v)
-{
-	struct mem_cgroup *memcg = mem_cgroup_from_seq(m);
-
-	seq_printf(m, "%d\n", READ_ONCE(memcg->zswap_writeback));
-	return 0;
-}
-
-static ssize_t zswap_writeback_write(struct kernfs_open_file *of,
-				char *buf, size_t nbytes, loff_t off)
-{
-	struct mem_cgroup *memcg = mem_cgroup_from_css(of_css(of));
-	int zswap_writeback;
-	ssize_t parse_ret = kstrtoint(strstrip(buf), 0, &zswap_writeback);
-
-	if (parse_ret)
-		return parse_ret;
-
-	if (zswap_writeback != 0 && zswap_writeback != 1)
-		return -EINVAL;
-
-	WRITE_ONCE(memcg->zswap_writeback, zswap_writeback);
-	return nbytes;
-}
-
 static struct cftype zswap_files[] = {
 	{
 		.name = "zswap.current",
@@ -8220,11 +8227,6 @@ static struct cftype zswap_files[] = {
 		.seq_show = zswap_max_show,
 		.write = zswap_max_write,
 	},
-	{
-		.name = "zswap.writeback",
-		.seq_show = zswap_writeback_show,
-		.write = zswap_writeback_write,
-	},
 	{ }	/* terminate */
 };
 #endif /* CONFIG_MEMCG_KMEM && CONFIG_ZSWAP */
