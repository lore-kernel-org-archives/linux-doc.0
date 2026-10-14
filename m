Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CC4518149
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 13:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984401; cv=none; b=R8VSXaMccRchM68JArMJSsY8lWLSoA5b8CbPQaGw8R+4g3a9yo3RNI+xrE/yKRhyErH+9UY+Ra0eGh0v/Up5dyq0PhROxH7xUwdCXkgH9p4Hc+y2Ybx4RHYYbxHShlBBSvRPzdxMYPX2ZIeTna4m5YRNIW+ejjrx9h+Zudw5gOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984401; c=relaxed/simple;
	bh=6Wjwv/Huy1cZ/r5qRcIo5rFWepUhagJ/WEP5VD8YMa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X0Z/1YZnN2/UxEzDCqm5lKXSg6hPYxBjthQSuiGiTOsLKTDGjTXLB/8lGG7jQrxlI+pG6PZR5gloiffUafvvNzc+M2ADzFkwsSYEAbRirHqg+tUa5QFovEf/7TQlBWbVui1q5VL5hLMXZKRh8tWsyTOK/Qz4wHGwzvA0cDg6qBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=lQYZ9WXv; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="lQYZ9WXv"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-533797e72e8so2204531cf.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 06:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791984398; x=1792589198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i9IOcxSqwYrBSr8BFbrbfz8etoo1JAf0XtOV1kMheuQ=;
        b=lQYZ9WXv3Q3VpT+aVY4LAvWuRFO0loiiiUepNoZX0MKnYJk+1n3nk39a75DWHIwfR9
         ABoHUjeq+/Rn2hSYjZs7jfM8gt0DaTeUWp4mB9I1rF6pR8qn7Z6kQIf1kqAAiZmDmh+i
         IoaJY6RViLAEoQ12QqTwki1y75Ms1GdF0gee5ON0tXpwJnbLKlwii7y0sHOV7YNo+9EN
         Cc3L+lOCIRpE8/Eioy0UqyRoKEBr8uHrg2SkZ3m5Jte0yy79aex8w9QeoRi4z6bWRsu/
         6SmL0JADly2qxSBOyh2wIc+Yt6arZYolFAvfFkKdjIZrpjLvfexSIYEO9d5Li2zD8cBl
         wIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984398; x=1792589198;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i9IOcxSqwYrBSr8BFbrbfz8etoo1JAf0XtOV1kMheuQ=;
        b=UpRXIZ2CYNki50Z3uBPBaIZOD/ob9ryikAth2AczQJZeHCSyNdlN54If71xqhKTxcO
         1GfzyRQH5J3SFKRELuv9HGxbvfkywiXZCwzofKWKRH7s6wrB2cAYcmvZ5Vdc2fvgGpF+
         GL+7Eq119FyXnVVK37LxClEtGGgu3+iV1PFzAYSCwQPSuozOHozt3ZF3LD9W1r0PONo6
         4R1dh0COmC5nWMffGJHELY2SOexMvM2iDL76mJkld7JMZO2f336NrRA2ySLc9MN5ob3a
         slwFdywYOxeEvuP7QJiE02Ty7xuaa4WN7j6wNbSK/ZGOlPQ6I2POvZHokF4DqqRqEUmo
         W6bw==
X-Forwarded-Encrypted: i=1; AKwUvBwY3NUPPweoQDNL00nnVpIQe/saXEtV1DKiBFocW1Q0a0Ejs3U69hNniLixyBcmBdZItBtfjMV2HrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/VmB2EfNZ3BrmUAWOgYIwdMCCmyFZ6y5kg1PVfwSXZkdkZHdm
	foWMolujFb0NG3hdjjBMZA7VE63liMIQUOxWYuv/uZqfnZ0zkXa0VCLfsoWLgamKgvo=
X-Gm-Gg: AYBFou153ZO/Mf6r6NkdfzUAb/uXzSdIzaEnyFBVRIpm7xuupEHwvRmfAbIRXyacOXy
	EGuBkxbA6QZwcnWk+aopUn3Ew2bfy1Ke7Y+MEPjz2VQv4l0+hivrTFxI7M6bPs87DbZ9p+e0egi
	k2NbTJE5GftvFtEk15tPdY+Fi9wXiXnHRWI0UjF5LZxqgAyF87p1o6AErFneByAlNbfwJZBkfvb
	uM05D91GEpWktCLMsNXvDjwlpSkNOQ22NWIixqv0GqNSU+1h8T/Okh0gWSNvK4/1eQZEKZL78UD
	bLtmjiFmKU3MjLX5mLHmjNpVnWaR95IfsVJiLCbKDxRA88SkYxg52dI3/AMA2r6YJaJ+qPUdeLR
	zFXe+tl2mbfgOxzcEKolTWcrouofR8hrNtsv8irSkXcP7YPZY9qH8a1hT7JenqyZgf2NmO1XngV
	U0MIFEuctTR06SGJsPMMG7HW9nOgriUES9pQJL2+0YhgY0cfnA3syq8vSJpYQwrP7bWw783mVyO
	kafF6lT93D66nqxxG/kKzpiUM2KKsM+PSyQrre5oDWaQiEibILl/0g=
X-Received: by 2002:a05:622a:5a0f:b0:535:f9df:cc8b with SMTP id d75a77b69052e-535f9e049f5mr53842251cf.21.1791984398464;
        Wed, 14 Oct 2026 06:26:38 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b731a6csm125043441cf.11.2026.10.14.06.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:26:38 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:26:36 -0400
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	joshua.hahnjy@gmail.com, ziy@nvidia.com, mingo@redhat.com, peterz@infradead.org, 
	mgorman@suse.de, riel@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 5/6] sched/numa: do not feed tiering promotions into task
 placement stats
Message-ID: <as-CxqUTS-DjO5HU@gourry-fedora-PF4VCD3F>
References: <20261014094347.99157-1-lizhe.67@bytedance.com>
 <20261014094347.99157-6-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014094347.99157-6-lizhe.67@bytedance.com>

On Wed, Oct 14, 2026 at 05:43:46PM +0800, Li Zhe wrote:
> NUMA balancing has separate mode bits for normal task placement and
> memory tiering. In memory-tiering-only mode, NUMA hinting faults on
> slow-tier pages are used to detect hot pages and promote them to a top
> tier. They are not normal task-placement faults.
> 
> task_numa_fault() already avoids normal placement accounting for slow-tier
> faults while memory tiering is enabled. However, a successful slow-to-fast
> promotion can bypass that check. do_numa_page() reports the destination
> node to task_numa_fault() after migration, so the fault is seen as a
> top-tier fault and can update p->numa_faults, task placement state and
> the preferred NUMA node.
> 
> Slow-tier PTEs store access-time metadata in the folio last-cpupid field.
> Before this change, numa_migrate_check() returned the same all-ones
> last_cpupid value for those faults that normal AutoNUMA uses for a first
> or unknown access. Those cases are different: the ordinary unset value
> means there is no previous CPU/PID sample, while a slow-tier access-time
> value means the field does not contain a cpupid at all.
> 
> Name the ordinary all-ones sentinel LAST_CPUPID_UNSET and use it for the
> normal first/unknown cpupid state. Return a distinct
> LAST_CPUPID_ACCESS_TIME value while the folio still carries access-time
> metadata. If normal NUMA balancing is disabled, keep the migrated-page
> accounting but skip normal task-placement accounting for those faults.
> 
> When normal NUMA balancing and memory tiering are both enabled, promoted
> pages can still feed task placement. In that mode, the user has enabled
> both CPU placement feedback and tiering promotion, so a promoted top-tier
> fault is treated as an ordinary unset-cpupid AutoNUMA fault.
> 
> A stale access-time value can also survive after memory tiering is
> disabled and later reach task_numa_fault() from a top-tier page, where
> the slow-tier validation no longer applies. Treat any remaining invalid
> last_cpupid as LAST_CPUPID_UNSET before task_numa_group() can decode a
> CPU from it.
> 
> This does not change whether a page is promoted. It only prevents
> memory-tiering-only promotion faults from being consumed by the normal
> AutoNUMA placement heuristic.
>

Similarly with prior patches - this is a pretty major change. Although I
agree with the premise, do you have any performance numbers that show
this change is beneficial?

It's quite difficult to determine what the user-face effects of this
change would be other than expecting some kind of performance benefit.

~Gregory
