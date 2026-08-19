Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5A94432FE
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 10:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787134337; cv=none; b=rGp+q9qsmRBfJpC7lYZA9KPkbhsMfvS6k278NuY3vgrctDaaXXd/fFVHkFAJv5LUKLklTdM9yVoX7VmkkKwv3+z76o/xE9wt+91xcO6z/52n4XiH4SsNxBGDcDjW2Mc6OUVunZL3cJIOoPNZPaQZ0z33f/oWlytAmvQkRqDHolI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787134337; c=relaxed/simple;
	bh=cPSYJUVx8noNo3D+Be39E5vaehGVuxy3YTv/wUoDNfA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HI+L+lLGPSmuPNg7x1UGDBH8jM6+kX9hEYoapdKGHjKslA2BqkbJ77bBhvXgGqZzUKGHFwQr5ViTZBhnuZeoSYPXoh02EjSh0cGfpzRww2lCRz55/49WUQXzgqGlunxWoptYyIB9R+dEqyTUfhiW8vO+NHSslcWnOJrRMGCmEbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfUfjoEp; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfUfjoEp"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so1485291a91.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 03:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134336; x=1787739136; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nYw354gvkQJ8jmQ1k/6yhNWm33Mvtpn0ssaQx3WcD2A=;
        b=YfUfjoEpT77y9oST3D/0i60h3W6+QfXE9JlGFCrPpaUsh+tMHMijNH3aDNMyEVIgrc
         FmoXLwWi03lWqO1ZWFNu4tJLpv1JkyZYllOtuSLApRZZNfs+xWhsaS2maOUxQVnCSKeM
         t1fLWWaDu7I/seUxCjVR/S2JadY1PgTtuhzdjsbfYNCUVuC+pLGkPsEgUmntamIKDBRe
         xB1kDyKtkf64pwrLyXi8RdeLbW9umYJC7kuUMZRx0yf2IFvRxfdbYsXhToENtSs1d3Va
         3yFenov5v936t+HGexRCJTKlwCa/LyVOnnSbCAaksJUejrTlq2ZOHbSGI3c/W8OWNqwH
         28pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134336; x=1787739136;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nYw354gvkQJ8jmQ1k/6yhNWm33Mvtpn0ssaQx3WcD2A=;
        b=cYYuBiG+XgtF+qNmfJGfzLp/70qjkxC/3sZY/trhXCGQwQEGpw0x2KbWpvmejAdKeJ
         syqgL4ZvTbHIMmiqlGPq0tv/Xk1cODNKshgcYddzXCG6mj4yMyOAw6lyf6Jak5CUIn2J
         dLeFfHQHJZfIJ9MTbr73ADEzaOwwF+nv2Vh64bqUeyEBJlri7EB0F9KacAMuH46Rbl8Z
         +jY3hAnxFCaGHQ8EiZyv5ANffV8AHpnFpNNa5q096iLgFRpU5mDgYM79tCYdbhwDm7Dj
         P/8JtjUV3p8xrtodN/x6aO6SBUg2wCt3MPJfanyg92snQSR8rxsUUWN487bqY/eN9Nkl
         Ur5A==
X-Forwarded-Encrypted: i=1; AHgh+RpkqjB/7zMR/b5SyQW+3bGUsqx6rd8K3ImyP49iwGdWiIO6ScivBPo43HPvWcPV/z46u87J6S9fwho=@vger.kernel.org
X-Gm-Message-State: AFuF++lV2PQ6K+x+kfAmcw3vSAEWiszujSJ/CzW9hZtDiuBDtu52aXuh
	3UVUx9tbQg0X/Ze3KbqCedPU7ZDRrkGasLJtjzl66y9qugRBbewfvUuT
X-Gm-Gg: AR+sD10+N0qA9uQWIqbLcttVP1mDSVeVg0dQdF3bWD0hCrstG7MSOGvEmQFtnPDFWm9
	1txxc2ucvuFfqo+Z0V4DVdW9b9oGPQDdEKMXdLhnRfcsN+OQQ7EZCOEGiPLu/bQtp43pjen6fdm
	PAfTYWGBTuW2Ug0gaVNhTH44vuFK4oQioqcmXBS37IsZZWF1ndBFI7i+fK8Ifl1f4yPc3m17XdU
	E2OKrvq+XJFuvWEd3NplsTjghWSXNpB+Y4aO7MD52IW8H1g0ESCnovcLOtbWFMEw1ojGT5lHTOq
	XnmumaN47av3CStHL4X6KkRVnLZ7u6pRf0euPrFg5MNFjj4Y4ihV6tmjloPajJrCDjAnlLKi769
	UVMpuAANmIMduW8kT+GYy/KyF0ae71wZOW4Qvi1nJi3xri0subSndOzAurpVSsnHD4ZXMDZep0m
	t64E8I0/jdVWJwLC4gB0Qn+jDUUrcAdn+0FcTB8JCCs0lsaW4WSTnWAIEY7YzC
X-Received: by 2002:a17:90b:5630:b0:38e:42f5:d096 with SMTP id 98e67ed59e1d1-3957f68f7bdmr869671a91.0.1787134335601;
        Wed, 19 Aug 2026 03:12:15 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:3ae5:75e6:e4f4:4401:4289])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f96ca41sm2089556a91.4.2026.08.19.03.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:12:15 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Wed, 19 Aug 2026 18:09:52 +0800
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: kexec@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, Dave Young <ruirui.yang@linux.dev>, 
	Pratyush Yadav <pratyush@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Coiby Xu <coxu@redhat.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 09/10] crash_dump: Disallow
 configfs/crash_dm_crypt_key/reuse if crash hotplug supported
Message-ID: <aoV8HkBNGRclxMPl@Rk>
References: <20260729033654.311541-1-coiby.xu@gmail.com>
 <20260729033654.311541-10-coiby.xu@gmail.com>
 <96a78b35-94f7-4b63-97d3-d0841681e2b4@linux.ibm.com>
 <anQb8aIXKXYzKqAR@Rk>
 <8d857834-e014-44d9-a112-d7fc8482d7c3@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d857834-e014-44d9-a112-d7fc8482d7c3@linux.ibm.com>

On Sun, Aug 09, 2026 at 05:36:50PM +0530, Sourabh Jain wrote:
>
>
>On 06/08/26 11:03, Coiby Xu wrote:
>>On Wed, Aug 05, 2026 at 05:39:28PM +0530, Sourabh Jain wrote:
>>>
>>>
>>>On 29/07/26 09:06, Coiby Xu wrote:
>>>>If crash hotplug is supported, dm-crypt keys saved to reserved memory
>>>>will be taken care of automatically. Thus it doesn't make sense to use
>>>>configfs/crash_dm_crypt_key/reuse. Reserving image->dm_crypt_keys_addr
>>>>is also unnecessary. Currently x86_64 and ppc64le have implemented
>>>>crash hotplug feature.
>>>>
>>>>Also update the doc accordingly. Note two doc issues are fixed as well.
>>>>
>>>>Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for 
>>>>CPU/memory hot-plugging")
>>>>Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>>>>---
>>>> Documentation/admin-guide/kdump/kdump.rst | 16 ++++++++++------
>>>> kernel/crash_dump_dm_crypt.c              | 23 ++++++++++++++++++++---
>>>> 2 files changed, 30 insertions(+), 9 deletions(-)
>>>>
>>>>diff --git a/Documentation/admin-guide/kdump/kdump.rst 
>>>>b/Documentation/admin-guide/kdump/kdump.rst
>>>>index 7587caadbae1..0bf2eb100a05 100644
>>>>--- a/Documentation/admin-guide/kdump/kdump.rst
>>>>+++ b/Documentation/admin-guide/kdump/kdump.rst
>>>>@@ -577,9 +577,10 @@ with /sys/kernel/config/crash_dm_crypt_keys 
>>>>for setup,
>>>> 1. Tell the first kernel what logon keys are needed to unlock 
>>>>the disk volumes,
>>>>     # Add key #1
>>>>-    mkdir /sys/kernel/config/crash_dm_crypt_keys/7d26b7b4-e342-4d2d-b660-7426b0996720
>>>>+    VOL1_UUID=7d26b7b4-e342-4d2d-b660-7426b0996720
>>>>+    mkdir /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID
>>>>     # Add key #1's description
>>>>-    echo cryptsetup:7d26b7b4-e342-4d2d-b660-7426b0996720 > 
>>>>/sys/kernel/config/crash_dm_crypt_keys/description
>>>>+    echo cryptsetup:$VOL1_UUID > 
>>>>/sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID/description
>>>>     # how many keys do we have now?
>>>>     cat /sys/kernel/config/crash_dm_crypt_keys/count
>>>>@@ -591,15 +592,18 @@ with 
>>>>/sys/kernel/config/crash_dm_crypt_keys for setup,
>>>>     cat /sys/kernel/config/crash_dm_crypt_keys/count
>>>>     2
>>>>-    # To support CPU/memory hot-plugging, reuse keys already 
>>>>saved to reserved
>>>>-    # memory
>>>>-    echo true > /sys/kernel/config/crash_dm_crypt_key/reuse
>>>>-
>>>> 2. Load the dump-capture kernel
>>>> 3. After the dump-capture kerne get booted, restore the keys to 
>>>>user keyring
>>>>    echo yes > /sys/kernel/crash_dm_crypt_keys/restore
>>>>+For CPU/memory hot-plugging, you can reuse keys already saved 
>>>>to reserved
>>>>+memory before reloading the kdump image,
>>>>+    echo true > /sys/kernel/config/crash_dm_crypt_keys/reuse
>>>>+
>>>>+Note if crash hotplug is supported, this API is totally 
>>>>unnecessary thus will
>>>>+be disabled automatically.
>>>>+
>>>> Contact
>>>> =======
>>>>diff --git a/kernel/crash_dump_dm_crypt.c 
>>>>b/kernel/crash_dump_dm_crypt.c
>>>>index b5b78656cf06..46d6b31c3ca4 100644
>>>>--- a/kernel/crash_dump_dm_crypt.c
>>>>+++ b/kernel/crash_dump_dm_crypt.c
>>>>@@ -310,6 +310,15 @@ static ssize_t 
>>>>config_keys_reuse_show(struct config_item *item, char *page)
>>>>     return sysfs_emit(page, "%d\n", is_dm_key_reused);
>>>> }
>>>>+static bool crash_hotplug_support(struct kimage *image)
>>>>+{
>>>>+#ifdef CONFIG_CRASH_HOTPLUG
>>>>+    return image->hotplug_support;
>>>
>>>I don't think it is good idea to access kexec_crash_image 
>>>properties without
>>>holding the kexec lock.
>>
>>Thanks for raising the concern! Let's discuss this issue in [PATCH 
>>v3 03/10].
>>
>>>
>>>Also, would it make sense to move this API somewhere else?
>>
>>Can you help me understand why to move this API? Is it because using
>>ifdef in .c file is discouraged?
>
>This API is used to verify crash hotplug support, which is not 
>directly related to crash_dm_crypt_keys.
>It also seems to be generally useful.
>
>- Sourabh Jain

Thanks for the clarification! After trying to make use of existing
crash_check_hotplug_support API in kernel/crash_core.c, I realize there
is no need to explicitly disallow configfs/crash_dm_crypt_key/reuse.
Because image->dm_crypt_keys_addr will be set to 0 when crash hotplug is
supported. Thus in fact the reuse API has already been implicitly
disallowed. So I will drop the unnecessary crash_hotplug_support
function in next version.

-- 
Best regards,
Coiby
