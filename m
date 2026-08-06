Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCED392825
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 05:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785994509; cv=none; b=gtg67NFP5CS8IdLze23tFXfhY2iCRMN9rDYwTryhaYUYFPBS6kedSoTYTGGFoKJUSCYRZKSfuAJbWxsYkcJ6zIiqUUEkJlkk0OwrNd1c8S2u9ohkSncf9rFTJn65t1h7pEXIriS0MXepj8uct/uVcJfaLzXGJDKPKzzEI1kt/bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785994509; c=relaxed/simple;
	bh=0DIMSdwvoOaahGwEaTISe/Lh7lZnQdcbsTcYAqkRBw0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SiJ/6GFLLk5BgJUc8wPIPb/RcavQ8d4JTNaLVqZffBnXZtkPMoV+1VQnD2T4cIvqDyzGNwANYSXnE3GOs5CglNk/mAmPu2EUwdpEQmD6OnmNnDTByN/FkCyFcGvV864P12mALwTpYamHneidvxMJDfKydvCDeX6ws6zNnaGJu14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYijF8xG; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYijF8xG"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1633020a91.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Aug 2026 22:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785994507; x=1786599307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ce6Z7GRW5DQHMpISjPPGbM/uRj0Rdd5zOogRucAGwTA=;
        b=mYijF8xG1yiC/BwOqxcft34uhWCNQVwqjcnV1+WP4+cIig/bcuDlUwJDrYXdiDVq49
         4rbkdvJgVK06hIsxjsx4qP4J2HIbI3t/YvdqMe67qsoE0XlEtF9lS2dT8b3cXcjS/0aq
         Mvn3fICz33Z8AWfPkydQzJ87Mj7WNvx50ZR9PSNZVidibbcQn0ysi5hmnZql7Ve+FCzS
         JBHrdV0Mjb9Q0bX45ly3S3M3Pt7zjCIXZgPG6KuVSHp1Pk2Oa7abhxrdqoBCT7Xeda9l
         uuckG3glQ6IocKGEo4SglIS3u596rRT7gAmsm/j1ZpZ3llAHP+mpoXY1Vbno0AuhOJW4
         NDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785994507; x=1786599307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ce6Z7GRW5DQHMpISjPPGbM/uRj0Rdd5zOogRucAGwTA=;
        b=FOuW0de1oxSoUYxhrTwf1mus2wVdxaJybljUMthoxGM+5qCE+8DlQwZfC7GlPvll4k
         jmUiEenJeEacls6IiTgznLeLJhBwxkGI6EmXHiYM4st+X8jfPfiFyAT5/rYcCo+VSCZF
         vU0DchrtzQTuAlQQSlRKZ6Rvl+m7a/wapbkNWyH2U7iroi0ij3oWDG0HVns/wj9Aku51
         4ZyftL25oVCGIde6tH183weidhd8ZJW8cIuWl+BC+uo/erHVeOhuUOzWlQ+sIMO/83AC
         t1NWOx5aVIpScajDae2NTDEhW9u+gu6/OqqvrcIXA0K12bo85tZycQi6K+3vQJosm9Zk
         jv4Q==
X-Forwarded-Encrypted: i=1; AHgh+RoWOsLtzZnNlT8B65Gvekibp4bT49YtS5YxjQrJPL1IJnliFodqDEAHpajN1ugCNccF/W+ROZLvGU0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2YM9jekh8zqv3H1CXOIk0W9IhhaZLS2foPIzGlA3EKE2MdWTi
	+m1Nsm92v0mSOW7yagSidz47jBs90ckPPjGZZo9dAM6wePR8zPqMh76P
X-Gm-Gg: AR+sD13kg/rYu0i4llyMtLemZHjmkaZfFz6IlF9cWq+2AG2VODDwlKZjjTNGpETdU0g
	h3GlRxz3ud5csgNcZowyyWjYwm9HyODVdJXDjXUfSzyTEz1AKAm0Q7J8BmzjgnJkR8K5VmdZyNc
	X2Ep+2pVfiiiOSlfzDUkIAW0naKc6ZjJilqz6b8eiACMt4+xYXwPCeBkfMiw6/DRrgrIwrWL7Gr
	tbX/0fiwbthjxt9P6gwCWDnmcMvR/tsaNdNWlmHGYudE3V4HVUNnfajLQpSRgzIqOs0nCjC/bzT
	qgNUPmfOZhltW7Fzkzce9vC/3RTqwXkVPcO5jrzUQdzsKh7lUpHeO6L8PaLit/JXURZ9X+nFfUm
	ocAXmRqV033/eHwhWZ3RpXlgDYBuZHXXgUHdfkwAUd7kiifuTs0zh9Dq9icBeqrCZucJihAsR6R
	UCIfkwZomaPWU1a9I38UtOhARxrkX2HAYcz0FtSj32PLA=
X-Received: by 2002:a17:90b:264c:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-3903c59936cmr13203948a91.8.1785994507344;
        Wed, 05 Aug 2026 22:35:07 -0700 (PDT)
Received: from localhost ([2a09:bac5:55f3:25af::3c1:3f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085e0eb56sm772257a91.10.2026.08.05.22.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:35:06 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Thu, 6 Aug 2026 13:33:03 +0800
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: kexec@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, Dave Young <ruirui.yang@linux.dev>, 
	Pratyush Yadav <pratyush@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Coiby Xu <coxu@redhat.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 09/10] crash_dump: Disallow
 configfs/crash_dm_crypt_key/reuse if crash hotplug supported
Message-ID: <anQb8aIXKXYzKqAR@Rk>
References: <20260729033654.311541-1-coiby.xu@gmail.com>
 <20260729033654.311541-10-coiby.xu@gmail.com>
 <96a78b35-94f7-4b63-97d3-d0841681e2b4@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <96a78b35-94f7-4b63-97d3-d0841681e2b4@linux.ibm.com>

On Wed, Aug 05, 2026 at 05:39:28PM +0530, Sourabh Jain wrote:
>
>
>On 29/07/26 09:06, Coiby Xu wrote:
>>If crash hotplug is supported, dm-crypt keys saved to reserved memory
>>will be taken care of automatically. Thus it doesn't make sense to use
>>configfs/crash_dm_crypt_key/reuse. Reserving image->dm_crypt_keys_addr
>>is also unnecessary. Currently x86_64 and ppc64le have implemented
>>crash hotplug feature.
>>
>>Also update the doc accordingly. Note two doc issues are fixed as well.
>>
>>Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
>>Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>>---
>>  Documentation/admin-guide/kdump/kdump.rst | 16 ++++++++++------
>>  kernel/crash_dump_dm_crypt.c              | 23 ++++++++++++++++++++---
>>  2 files changed, 30 insertions(+), 9 deletions(-)
>>
>>diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
>>index 7587caadbae1..0bf2eb100a05 100644
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
>>@@ -591,15 +592,18 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
>>      cat /sys/kernel/config/crash_dm_crypt_keys/count
>>      2
>>-    # To support CPU/memory hot-plugging, reuse keys already saved to reserved
>>-    # memory
>>-    echo true > /sys/kernel/config/crash_dm_crypt_key/reuse
>>-
>>  2. Load the dump-capture kernel
>>  3. After the dump-capture kerne get booted, restore the keys to user keyring
>>     echo yes > /sys/kernel/crash_dm_crypt_keys/restore
>>+For CPU/memory hot-plugging, you can reuse keys already saved to reserved
>>+memory before reloading the kdump image,
>>+    echo true > /sys/kernel/config/crash_dm_crypt_keys/reuse
>>+
>>+Note if crash hotplug is supported, this API is totally unnecessary thus will
>>+be disabled automatically.
>>+
>>  Contact
>>  =======
>>diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
>>index b5b78656cf06..46d6b31c3ca4 100644
>>--- a/kernel/crash_dump_dm_crypt.c
>>+++ b/kernel/crash_dump_dm_crypt.c
>>@@ -310,6 +310,15 @@ static ssize_t config_keys_reuse_show(struct config_item *item, char *page)
>>  	return sysfs_emit(page, "%d\n", is_dm_key_reused);
>>  }
>>+static bool crash_hotplug_support(struct kimage *image)
>>+{
>>+#ifdef CONFIG_CRASH_HOTPLUG
>>+	return image->hotplug_support;
>
>I don't think it is good idea to access kexec_crash_image properties without
>holding the kexec lock.

Thanks for raising the concern! Let's discuss this issue in [PATCH v3 03/10].

>
>Also, would it make sense to move this API somewhere else?

Can you help me understand why to move this API? Is it because using
ifdef in .c file is discouraged?

>
>- Sourabh Jain
[...]

-- 
Best regards,
Coiby
