Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCEC35FF5C;
	Wed, 14 Jan 2026 07:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768375609; cv=none; b=EfKxqIgBVuQvZtvl/uZTJX+oUPHkxWtVT55oIFYLaK34hbI+GAi6LEH9B8ItoGohEza5rxO1BEvCcVXIqwLLwfbJC+10vxAH95cTRlVuk3ucDSILP26YOhFcyz8UYYqCUGpbg1FaXWxR0jW47rJr+nxaW1EFXUptT15iA0n7XUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768375609; c=relaxed/simple;
	bh=8MY3tCzYH4LjFUppMbMgZpe/HPePXtf+OKAPtC4LYdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aKhGweLTXVlObdw+s9oXP/9OI7gRu02PLkOyhfk5ZNW+3lakpD9wBVZTiA1Nln/W7KWXu8MFIdny8XEKDnagCeSK5CP7YmltHyZN7YN1lDts39FBmS4QjQR8JGA8wHoaCxidqmjwennhjQfvSIrGVTLKemJGo3ZtecoBKoleLlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=iCU2IWq3; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="iCU2IWq3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=sDfhHZq7pNuGramNwSmcc9whrmx0jtWM21KT7YNBBeQ=;
	b=iCU2IWq3Z1xq2GxuiyHBBn5sQAv+AskaZoeE6RjOELgW1d5TomuijJU/q8M53k
	0dgxPAyfvfJGXN1iFVNtgOZzJ6b26XQnzYgXqM7x+r0F2QR0hOKfIY/0Y0wmkC2I
	gxlgoylmKpYu7tuYN+i7rKhoewFrLqvo4YNBIIVBTbMCQ=
Received: from ubuntu24-z.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBXu7XVRGdpOfHRFw--.72S2;
	Wed, 14 Jan 2026 15:25:11 +0800 (CST)
From: ranxiaokai627@163.com
To: surenb@google.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	david@kernel.org,
	kent.overstreet@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	ran.xiaokai@zte.com.cn,
	ranxiaokai627@163.com,
	rppt@kernel.org,
	vbabka@suse.cz
Subject: Re: [PATCH] alloc_tag: remove sysctl prefix from mem_profiling boot parameter
Date: Wed, 14 Jan 2026 07:25:00 +0000
Message-ID: <20260114072507.163364-1-ranxiaokai627@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJuCfpFTJUowSAjNum1zecDJYuyUi84vUNkoNNf=CnUwpsTVeg@mail.gmail.com>
References: <CAJuCfpFTJUowSAjNum1zecDJYuyUi84vUNkoNNf=CnUwpsTVeg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXu7XVRGdpOfHRFw--.72S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGryUWry3Kr4rKr4kKw1kuFg_yoWrAF1fpF
	y0gF1Ykw4kJryxCr92ya4Ik34Syw48Jw42qasFgry7ZwnIkrWDJr1kKFWS9FnrXFZFkF4r
	XF1jvr97uw1UAwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUo5lUUUUUU=
X-CM-SenderInfo: xudq5x5drntxqwsxqiywtou0bp/xtbC7hh7x2lnRNhn2QAA3m

>On Mon, Jan 12, 2026 at 7:50 PM Kent Overstreet
><kent.overstreet@linux.dev> wrote:
>>
>> On Tue, Jan 13, 2026 at 03:27:35AM +0000, ranxiaokai627@163.com wrote:
>> > >On Fri, Jan 09, 2026 at 06:24:19AM +0000, ranxiaokai627@163.com wrote:
>> > >> From: Ran Xiaokai <ran.xiaokai@zte.com.cn>
>> > >>
>> > >> Boot parameters prefixed with "sysctl." are processed separately
>> > >> during the final stage of system initialization via kernel_init()->
>> > >> do_sysctl_args(). Since mem_profiling support should be parsed
>> > >> in early boot stage, it is unsuitable for centralized handling
>> > >> in do_sysctl_args().
>> > >> Also, when CONFIG_MEM_ALLOC_PROFILING_DEBUG is enabled,
>> > >> the sysctl.vm.mem_profiling entry is not writable and will cause
>> > >> a warning. To prevent duplicate processing of sysctl.vm.mem_profiling,
>> > >> rename the boot parameter to "mem_profiling".
>> > >>
>> > >> Signed-off-by: Ran Xiaokai <ran.xiaokai@zte.com.cn>
>> > >
>> > >How was this observed/detected?
>> >
>> > Actually no kernel bug or funtional defect was observed through testing.
>> > Via code reading, i found after commit [1],
>> > boot parameters prefixed with sysctl is processed redundantly.
>
>I was able to reproduce the warning by enabling
>CONFIG_MEM_ALLOC_PROFILING,
>CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT,
>CONFIG_MEM_ALLOC_PROFILING_DEBUG, CONFIG_SYSCTL and setting
>CONFIG_CMDLINE="1".
>The fix I posted eliminates that warning. Ran, you can post my
>suggestion yourself with me as Suggested-by or I can post it with you
>as Reported-by. Let me know your preference.

I think this version is better.

[PATCH] alloc_tag: fix rw permission issue when handling boot parameter

Boot parameters prefixed with "sysctl." are processed
during the final stage of system initialization via kernel_init()->
do_sysctl_args(). When CONFIG_MEM_ALLOC_PROFILING_DEBUG is enabled,
the sysctl.vm.mem_profiling entry is not writable and will cause
a warning.

Before run_init_process(), system initialization executes in kernel
thread context. Use current->mm to distinguish sysctl writes during
do_sysctl_args() from user-space triggered ones.

And when the proc_handler is from do_sysctl_args(), always return success
because the same value was already set by setup_early_mem_profiling()
and this eliminates a permission denied warning.

Signed-off-by: Ran Xiaokai <ran.xiaokai@zte.com.cn>
Suggested-by: Suren Baghdasaryan <surenb@google.
---
 lib/alloc_tag.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index 846a5b5b44a4..00ae4673a271 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -776,8 +776,22 @@ EXPORT_SYMBOL(page_alloc_tagging_ops);
 static int proc_mem_profiling_handler(const struct ctl_table *table, int write,
 				      void *buffer, size_t *lenp, loff_t *ppos)
 {
-	if (!mem_profiling_support && write)
-		return -EINVAL;
+	if (write) {
+		/*
+		 * Call from do_sysctl_args() which is a no-op since the same
+		 * value was already set by setup_early_mem_profiling.
+		 * Return success to avoid warnings from do_sysctl_args().
+		 */
+		if (!current->mm)
+			return 0;
+
+#ifdef CONFIG_MEM_ALLOC_PROFILING_DEBUG
+		/* User can't toggle profiling while debugging */
+		return -EACCES;
+#endif
+		if (!mem_profiling_support)
+			return -EINVAL;
+	}
 
 	return proc_do_static_key(table, write, buffer, lenp, ppos);
 }
@@ -787,11 +801,7 @@ static const struct ctl_table memory_allocation_profiling_sysctls[] = {
 	{
 		.procname	= "mem_profiling",
 		.data		= &mem_alloc_profiling_key,
-#ifdef CONFIG_MEM_ALLOC_PROFILING_DEBUG
-		.mode		= 0444,
-#else
 		.mode		= 0644,
-#endif
 		.proc_handler	= proc_mem_profiling_handler,
 	},
 };
-- 
2.25.1


>> When bcachefs was in the kernel, I spent an inordinate amount of time in
>> code reviews trying to convince people that yes, they really do need to
>> be testing their code.
>>
>> Strangely enough, I have never had this issue with project contributors
>> who did not come to the project by way of the kernel community... :)

