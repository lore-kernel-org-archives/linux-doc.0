Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B3D2BE7DB
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 14:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229500; cv=none; b=KwhBOzn4gS4qahdOdQ9/NfEn9MiXlWvmfy66IZgAoPXDp2vd3ZX1/eUTAEsmEe7NxjNuiBaJR9482s9MXm16EvfiEdHeXh7NZb8N/GcHis0phSPqk1PfMGe1mugzuDijnuwmUUEkl71tfIlC3QYKkBQOHn7Wzm8FDUckwWlo6+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229500; c=relaxed/simple;
	bh=KfleazqhiYVtUyRFQa0Rnp9RAnsfoqSNonzAP4I3m2w=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ta9enIaefhnoSZSf/gKL8zjEgk2v/Ct7E7TN43Rtzry9umKcjlDBnHGW6Qoa7+NLKD4hQcffi/VLhISJuGGT2s4iYOvwexETNru5Np6SHxgojpIbN0jnGv7iuT/WnKOL9T/8DAp0Qxd2kB2PdQE/EwmTKPuWBgJ582lct11zjcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PiwfhH08; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=H1hFfSdX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PiwfhH08";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="H1hFfSdX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768229498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sA5gJz/+vgMSarS6A+nPZ5R89JHYOj2EYgVc9sCvFKA=;
	b=PiwfhH08NkQtuL2py8b2I8TFyJ6JBanQff77WDxklHFRxQnqhSYqzNTRw9l3QiIkst6QGz
	0cFDc08qd2ENqYUq1/tDe2+oLbQ/5bjY5kK5klsjQXrFOZsukr+Jt+Dv9rbKdLJD29aX3H
	CCktVkBvEWPUd6BDLddUMMa0Wa6LcQY=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-V0WLLe6cMSmjBG4FTMgpVw-1; Mon, 12 Jan 2026 09:51:36 -0500
X-MC-Unique: V0WLLe6cMSmjBG4FTMgpVw-1
X-Mimecast-MFC-AGG-ID: V0WLLe6cMSmjBG4FTMgpVw_1768229496
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5635063cc48so4226117e0c.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 06:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768229496; x=1768834296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sA5gJz/+vgMSarS6A+nPZ5R89JHYOj2EYgVc9sCvFKA=;
        b=H1hFfSdX03LD81cp6Q7aFhUHsu77TxhwUI5hoyrzyrVKVw+wB8s3rkOaK6ruiAIwnj
         qrZSzjguhTTCIAVqRkDCF8OEd6lIuJ9cZTjrK9UNmxI1IwBE/wNDhNid1cz6oyajh2AS
         dAEEzO98unRnWCI4ynw2PHooBoFR+1NZ8OgYkolGhPMpMKAJ39OyxMgR8giluj4F0nZu
         yzF4EamLTF5Le8GD5Bc02fvPk1E9fostNDqawdGLk10+wk7be0NPmW4Kx7ZXC04gXzio
         BoMDgWMnNjU4hp0QeyuhZ1o/zUQGBRL9FumPOwU0WxJgsvDSLTtvWnfl1ZUn/rU4dalc
         /C9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229496; x=1768834296;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sA5gJz/+vgMSarS6A+nPZ5R89JHYOj2EYgVc9sCvFKA=;
        b=ac2BinGZ1jVy+20nz2sdUC5F2YWFXOY3d8IPmTN6EX8qEJKP2oA0Q1SNRNq5Ar2inr
         /FQHzt+lpcqppR3fWWwXCHQfV5X0Vgik0wnuJ9Jo0k4orjm4/tt853ZbiULGJh+ZMtpp
         EUIBh+xLDWhXitxsgV/sKTdnKgF6TYJ+GByCiV5XwiBjznWMv71NifFuweK/lCfSVDXg
         YnLcFefa5Kew0DYq+RAlKt+Akf5uAaAL2jtccNME77TmJmthKuNnMj47F26mt8hq9EhW
         HTgAjrCHeOO7r6EhbYwoRdiRr3n08qfC0ecZqRiPuIEF5O7uUUSeqHd8r8a1OsdhO2kt
         yVew==
X-Forwarded-Encrypted: i=1; AJvYcCVSWkaRtBYnAqW+bA7CRBpLDxzMelTrxTQbHpLpBu8jPHJdgTzZ+UXEPtKh7P/EQOPOVuf3UxlAfZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcB3ZA/W2y9zeq/FPzH1tgio95agrZID3oCMRv6qNZSLL6tmdw
	wfEKiG8VkSZmgjgui0GpPowyRtu0mi1sZ9GJ6UdDSd2HKi/jVn+Td0OKQaFoGErzktDQURbwq6B
	lG4Zy2bRKjpho7J/bXmsBEvnrsqT09mnBd936qFZ1SYaqANpJHFspHOr8Zx7a0Q==
X-Gm-Gg: AY/fxX4tiOitSiyOTJ2z1uZxuLgZQIUJGkQ9c2nqdgzuVa/E/2Oxmn+AHGj3pWKnhS6
	muT0OS1OS1oiCm6/9r8Pa+ggZWWLEGziBfIrhW4W//MVEuZ6l72b8AJ35h3tArvPjJbwYSgCldd
	GwhFhsN1CeTXzPfz8Se5VLBjYyoRnFBDqaMcpEDu65B3ovndxRfor9i/hJ35+Qm7cqGwUS84sF5
	vobp13CQxbGrAwLCx4KHKDwdI1GEkE+BeSLU2XoLyg3w1yXmw+tfNC4u2QFbkdPku/uG/S4FolP
	hecws/E2BHfnWbhHes+n5JRn+hc2Pnk2dgxF0UYlUuPCpF2HzYNJFUpH3D6keWPcEFiKXiW5iya
	wP55m8OPNSDjTR9OOhdA+D8oFKOT+8IKxpGEruuOCnCNL7YIZccuKDDil
X-Received: by 2002:a05:6122:8b8d:b0:55b:7494:1737 with SMTP id 71dfb90a1353d-56347fd2b6bmr4913665e0c.15.1768229496021;
        Mon, 12 Jan 2026 06:51:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMkEp2BHK2L7pl73R9OM4XWJTWqWIN5qUtiLpa/I4atEkU0kDVexMtW/lTi8Ub6jSdOpy+uw==
X-Received: by 2002:a05:6122:8b8d:b0:55b:7494:1737 with SMTP id 71dfb90a1353d-56347fd2b6bmr4913647e0c.15.1768229495568;
        Mon, 12 Jan 2026 06:51:35 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124c452asm16438567241.13.2026.01.12.06.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 06:51:35 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <f33eb2b3-c2f4-48ae-b2cd-67c0fc0b4877@redhat.com>
Date: Mon, 12 Jan 2026 09:51:28 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH cgroup/for-6.20 v4 4/5] cgroup/cpuset: Don't invalidate
 sibling partitions on cpuset.cpus conflict
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 Sun Shaojie <sunshaojie@kylinos.cn>, Chen Ridong
 <chenridong@huaweicloud.com>, Chen Ridong <chenridong@huawei.com>
References: <20260112040856.460904-1-longman@redhat.com>
 <20260112040856.460904-5-longman@redhat.com>
 <2naek52bbrod4wf5dbyq2s3odqswy2urrwzsqxv3ozrtugioaw@sjw5m6gizl33>
Content-Language: en-US
In-Reply-To: <2naek52bbrod4wf5dbyq2s3odqswy2urrwzsqxv3ozrtugioaw@sjw5m6gizl33>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/12/26 5:51 AM, Michal Koutný wrote:
> On Sun, Jan 11, 2026 at 11:08:55PM -0500, Waiman Long <longman@redhat.com> wrote:
>> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> ...
>> @@ -2632,6 +2641,9 @@ Cpuset Interface Files
>>   
>>   	The root cgroup is always a partition root and its state cannot
>>   	be changed.  All other non-root cgroups start out as "member".
>> +	Even though the "cpuset.cpus.exclusive*" control files are not
>> +	present in the root cgroup, they are implicitly the same as
>> +	"cpuset.cpus".
> cpuset.cpus.effective (that one is on root cpuset cg)
>
> (This was likely lost among my v2 comments.)

Sorry, I might have missed this comment of yours. The 
"cpuset.cpus.exclusive" file lists all the CPUs that can be granted to 
its children as exclusive CPUs. The cgroup root is an implicit partition 
root where all its CPUs can be granted to its children whether they are 
online or offline. "cpuset.cpus.effective" OTOH ignores the offline CPUs 
as well as exclusive CPUs that have been passed down to existing 
descendant partition roots so it may differ from the implicit 
"cpuset.cpus.exclusive".

Cheers,
Longman

