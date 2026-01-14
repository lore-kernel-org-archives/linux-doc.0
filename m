Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0138627B32C;
	Wed, 14 Jan 2026 04:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768365105; cv=none; b=JFi6lhlUZTFid9gJ9HWNAU5flvvGioBrtAfvo8NSOU4x1V9z9EKg7w1aMF8epHBTEYt0ip7PuiTBswMIQkiGv36lYvNIvo/T+aj9to+H2Ww8Z6WNBNiuokFvIcXYlOeVG2wNBp2mBYE+dYyZ2urpR1SXWSKuN0WzbxnmSi1inzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768365105; c=relaxed/simple;
	bh=eSPUjqLLtC9I9V3KI00zjee2gofYWVxjkY5gWJI0dQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nAHtNRksgkF1kmuCOXH8srz8hXclIkpJC3OC3gUOf/ZWL0XbnoYRdW5rZjwfN4afY2U5pqzZmgvxp7D2z0nmlFxAjZlYdCE3KGgbNv9AecgOQ6sdHCbbCAjs/C8yAmIM2Lcl/E79bvVFml4mInwMvpGcqkg5ATII9ivV/KubXC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YA72Lkoc; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YA72Lkoc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=c54yyOgKWU3UcRhYLgdv4hIpfkij19xD2QDOn7kfvSE=;
	b=YA72LkocQ9tsCZzGg+LWG6+QqGKVRW9RnYEO9c84ihV5/C2xSpCQtzuScal2C6
	ki4PFrTgZtHVzH9zmnqGVJDD0e2I9/SZOImN1clNJcBTb9msbloarndPVWnhElCV
	0YReg5bcVuyW3I9xHuPKS+Kaw3TWjhk5rwezvDkf2Kj88=
Received: from ubuntu24-z.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgAH3azEG2dpCT6CLQ--.114S2;
	Wed, 14 Jan 2026 12:29:59 +0800 (CST)
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
Date: Wed, 14 Jan 2026 04:29:41 +0000
Message-ID: <20260114042954.163174-1-ranxiaokai627@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJuCfpFTJUowSAjNum1zecDJYuyUi84vUNkoNNf=CnUwpsTVeg@mail.gmail.com>
References: <CAJuCfpFTJUowSAjNum1zecDJYuyUi84vUNkoNNf=CnUwpsTVeg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgAH3azEG2dpCT6CLQ--.114S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRiDG5UUUUU
X-CM-SenderInfo: xudq5x5drntxqwsxqiywtou0bp/xtbCxQcseGlnG8eyIAAA3W

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

Hi, Suren

Thanks for your review and suggestion.
I will send v2 with the Suggested-by label.

I changed the code a little, because when i tested with
CONFIG_MEM_ALLOC_PROFILING_DEBUG disalbed and CONFIG_CMDLINE="1,compressed",
the warning remains:

Failed to set sysctl parameter 'vm.mem_profiling=1,compressed': invalid value

This is because proc_do_static_key() only accept 0 or 1 for write.

Subject: [PATCH] alloc_tag: fix rw permission issue when handling boot parameter

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
Suggested-by: Suren Baghdasaryan <surenb@google.com>
---
 lib/alloc_tag.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index 846a5b5b44a4..c534c1c45f32 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -776,8 +776,22 @@ EXPORT_SYMBOL(page_alloc_tagging_ops);
 static int proc_mem_profiling_handler(const struct ctl_table *table, int write,
 				      void *buffer, size_t *lenp, loff_t *ppos)
 {
-	if (!mem_profiling_support && write)
-		return -EINVAL;
+	if (write) {
+		if (!current->mm)
+			/*
+			 * Call from do_sysctl_args() which is a no-op since the same
+			 * value was already set by setup_early_mem_profiling.
+			 * Return success to avoid warnings from do_sysctl_args().
+			 */
+			return 0;
+#ifdef CONFIG_MEM_ALLOC_PROFILING_DEBUG
+		else
+			/* User can't toggle profiling while debugging */
+			return -EACCES;
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

what do you think?

>> When bcachefs was in the kernel, I spent an inordinate amount of time in
>> code reviews trying to convince people that yes, they really do need to
>> be testing their code.
>>
>> Strangely enough, I have never had this issue with project contributors
>> who did not come to the project by way of the kernel community... :)

