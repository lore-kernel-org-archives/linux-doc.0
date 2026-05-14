Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7515C3DB64A
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 07:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783669954; cv=none; b=YMSC080Snzt8W06BVBuz7Eam0VXtVjK8lJCEn/RahuZTF8ZKtMVOjgyGn4hOdAwkr78h/kSTWXxnPgYlsC/1WMAhbAaQbnK4ISOot+H4QZS9YYLUeV2R2mh7BXu8l+OE9FHZas40ysI3FgH+zT3W/cL8GOqcwMo8AhBo+glcVfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783669954; c=relaxed/simple;
	bh=0ys9bJ1dRRDkhbA0bR/ycLDkR83xfKIXo7/1x2I3rLE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXWTOdoZt8qPLjS8gvvl2HigciYztAXMSmFVsLCUSB2cq9yQ/X94vW777zopwwzz1/37I8fVoR1BhaZYr7LxEyfCYF9rTOxeH5v48rLJHl0+jmnYIsa3OHjAi3nKeXDPKo04hXqhreYw17VTYsgi5wZt+lMxVi5FqMaF5mYoGdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBnrV/xg; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBnrV/xg"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6611669cd16so923150d50.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 00:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783669951; x=1784274751; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yGROxrVsDdWg08azYq6DXXbTXSIemX2xa+e3jxJ14pI=;
        b=WBnrV/xgsSSAePTiFBY2O8VMnehl7SdWWxGj4hkreGMhMsNpRxoUrbqWdve2xbL+UB
         zR2qgXnPDMiowKthDUV79meHDo8jvR93iR3+ObxaVQWo/VB+k4AOSMpitlRZvCN+3vAB
         a8YX/6XIqBhv0TeTJ8bGiktM80eOOAm9/ET6m7PrYiOT8w2ZIHO5QttVIIz2OTaPsCrz
         NoK5+cjrSev+xDh4eDP5zY8ujqyi4N1+7k3xmlfMx0FfqgO37QAmAcHBj1BNUdKUaw5+
         Oy8U0aOEjr+8Rkd9oREqsb1h9BLuCC/Q8ryrSgnXd/Kh4uzxsE7KX7YBFqswdRIQmmLs
         4qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669951; x=1784274751;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yGROxrVsDdWg08azYq6DXXbTXSIemX2xa+e3jxJ14pI=;
        b=Rp/pwi+y9vJ8QMu8cMXK9PABvIoB3sCvf8cX134oUh8EJnJM8LFjuG6uxifIvVchgf
         Gk9zqH1/QVKTU846gHMtt0K+Knwtj1XlByPROH5bk2ZmL8EuMJoYU0chkO8o7FgmN6PZ
         yGpHLsaWnBfhIVytq251TrCK7+SyCelpi5/sJhmIoJaZ8M8bYoi0ITTD1xiJA9vYw5Pv
         l63kpEnqv/dDV8XDn+hzoXVOYE0hpb0ahV0K6FIv9V/qs7xfC6TTj+92NrOv5prsNwSW
         2iF2V/91mjIUkHQ0SqaGWzURFAvcnTmsALmMxiNyrGU9afZCLLZ1TgqEQuaAHnrZwjYl
         iE9g==
X-Forwarded-Encrypted: i=1; AHgh+Rqa9lQJmLXbdIMjzPeck8rz+Q1tFewjCf3KcNdV3DmrkKJx4H2UbO2KQb/DqFSEm0Fh8kLUxF9n8fc=@vger.kernel.org
X-Gm-Message-State: AOJu0YytKwfc3PS1KMs20lq6Y2gIRxhUH4R8jqOGvuY2uVJM4znWHyLJ
	yUuXAv/zPpmRuz2/JCimqCkACOvawj2MbtVLM0htqJWV/0Vh4iU3ZXjH
X-Gm-Gg: AfdE7clXwIupXNGyMkTVzBherUfSyi4k0iEOTuAJPo90SwoxfF+h+MVF+214oQUGrr1
	AVlJgTiUyBRwwuF1nnNQSUbAIgkpXKOZz6wNCiokYTv3zrcaN2jOckw5xzVPDlKRk0PE5nFSwBU
	2sOnKNxY0kKVxeMC0Vd1flQp/izpHgzBWX12SY6BzdIdQOTAN4TDVq9ePW8WXffeoMpivWEwSKY
	fVq0OmM1z/x0xk1PgnHLsoLbzcn3aZ/AcCA1KgKpFt+4Zs26Cj9zbiQuGyv2jXMK/sdtxNQB2Vj
	ZNwdkxazreo471wx6nf0nfWjTcXJ36Y7S9Bhnj9lryJgHth5OCMPaC/wn40QR+hbFX6fmq5zrRc
	SigR0GVp9+i+I0mc0AumKXfLeyJLW5UXcdQWjf/7LP0Snct6SYGmKX53O39znuwLlUTLi6Kb/+B
	gSXpUznEoAHrawS8osoCS7geLqIWrxST37Wb2cArGlCg==
X-Received: by 2002:a05:690e:4105:b0:664:de27:9ddc with SMTP id 956f58d0204a3-6679f10be4dmr7511574d50.38.1783669951329;
        Fri, 10 Jul 2026 00:52:31 -0700 (PDT)
Received: from localhost (tpcc3a204.netvigator.com. [219.76.18.204])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-667879ca0d7sm6156458d50.12.2026.07.10.00.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:52:30 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Thu, 14 May 2026 17:13:31 +0800
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: kexec@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, Dave Young <ruirui.yang@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Coiby Xu <coxu@redhat.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 8/9] crash_dump: Disallow
 configfs/crash_dm_crypt_key/reuse if CONFIG_CRASH_HOTPLUG enabled
Message-ID: <agWRYmkYVz1rhnr8@Rk>
References: <20260501234342.2518281-1-coiby.xu@gmail.com>
 <20260501234342.2518281-9-coiby.xu@gmail.com>
 <5af6fd0b-0eca-4089-b76c-45dcc4bf01ed@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5af6fd0b-0eca-4089-b76c-45dcc4bf01ed@linux.ibm.com>

On Wed, May 06, 2026 at 09:39:35PM +0530, Sourabh Jain wrote:
>
>
>On 02/05/26 05:13, Coiby Xu wrote:
>>If CONFIG_CRASH_HOTPLUG is enabled, dm-crypt keys saved to reserved
>>memory will be took care of automatically. Thus it doesn't make sense
>>to use configfs/crash_dm_crypt_key/reuse. Reserving
>>image->dm_crypt_keys_addr is also unnecessary. Currently x86_64 and
>>ppc64le have implemented CONFIG_CRASH_HOTPLUG feature.
>>
>>Also update the doc accordingly. Note two doc issues are fixed as well.
>>
>>Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
>>Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>>---
>>  Documentation/admin-guide/kdump/kdump.rst |  9 ++++++---
>>  kernel/crash_dump_dm_crypt.c              | 14 +++++++++++---
>>  2 files changed, 17 insertions(+), 6 deletions(-)
>>
>>diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
>>index 7587caadbae1..73f2e9500c60 100644
>>--- a/Documentation/admin-guide/kdump/kdump.rst
>>+++ b/Documentation/admin-guide/kdump/kdump.rst
>>@@ -577,9 +577,10 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
>>  1. Tell the first kernel what logon keys are needed to unlock the disk volumes,
>>      # Add key #1
>>-    mkdir /sys/kernel/config/crash_dm_crypt_keys/7d26b7b4-e342-4d2d-b660-7426b0996720
>>+    VOL1_UUID=7d26b7b4-e342-4d2d-b660-7426b0996720
>>+    mkdir /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID
>>      # Add key #1's description
>>-    echo cryptsetup:7d26b7b4-e342-4d2d-b660-7426b0996720 > /sys/kernel/config/crash_dm_crypt_keys/description
>>+    echo cryptsetup:$VOL1_UUID > /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID/description
>>      # how many keys do we have now?
>>      cat /sys/kernel/config/crash_dm_crypt_keys/count
>>@@ -593,7 +594,9 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
>>      # To support CPU/memory hot-plugging, reuse keys already saved to reserved
>>      # memory
>>-    echo true > /sys/kernel/config/crash_dm_crypt_key/reuse
>>+    # Note if CONFIG_CRASH_HOTPLUG is enabled, this API is totally unnecessary
>>+    # thus will be disabled.
>>+    echo true > /sys/kernel/config/crash_dm_crypt_keys/reuse
>>  2. Load the dump-capture kernel
>>diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
>>index 36e51807d94f..7a7cae17f578 100644
>>--- a/kernel/crash_dump_dm_crypt.c
>>+++ b/kernel/crash_dump_dm_crypt.c
>>@@ -304,6 +304,11 @@ static ssize_t config_keys_reuse_store(struct config_item *item,
>>  	bool val;
>>  	int r;
>>+	if (IS_ENABLED(CONFIG_CRASH_HOTPLUG)) {
>>+		pr_info("CONFIG_CRASH_HOTPLUG already enabled");
>>+		return -EINVAL;
>>+	}
>>+
>
>Deciding this solely at compile time can create issues. For example, 
>the kernel
>may be built with CONFIG_CRASH_HOTPLUG, but if kexec tool loads the kdump
>kernel using the kexec_load system call without hotplug support, it can
>cause problems. It is rare but possible.
>
>How about this:
>
>#ifdef CONFIG_CRASH_HOTPLUG
>    if (kexec_crash_image->hotplug_support) {
>pr_info("crash image is loaded with hotplug support\n");return -EINVAL;
>    }
>#endif
>
>This code should be placed after validating kexec_crash_image.

I didn't know CONFIG_CRASH_HOTPLUG isn't sufficient to tell hotplug
support is available. Thanks for pointing it out! Although
crash_load_dm_crypt_keys is only called during kexec_file_load syscall,
it will be good to apply your suggestion!

>
>
>- Sourabh Jain
>
>>  	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
>>  		pr_info("dm-crypt keys haven't be saved to crash-reserved memory\n");
>>  		return -EINVAL;
>>@@ -486,15 +491,18 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>  void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image)
>>  {
>>  	/*
>>-	 * For CPU/memory hot-plugging, the kdump image will be reloaded. Prevent
>>-	 * keys_header from being cleaned up during unloading when
>>-	 * is_dm_key_reused=true
>>+	 * For CPU/memory hot-plugging without CONFIG_CRASH_HOTPLUG, the whole kdump
>>+	 * image will be reloaded. Prevent keys_header from being cleaned up during
>>+	 * unloading when is_dm_key_reused=true
>>  	 */
>>  	if (!is_dm_key_reused) {
>>  		kfree_sensitive(keys_header);
>>  		keys_header = NULL;
>>  	}
>>+	if (IS_ENABLED(CONFIG_CRASH_HOTPLUG))
>>+		image->dm_crypt_keys_addr = 0;

I'll also adjust this part accordingly. Thanks!

Sorry I didn't notice this email and the email for [PATCH v2 2/9] had never
been sent out because of a msmtpqueue lock issue until last week.

-- 
Best regards,
Coiby
