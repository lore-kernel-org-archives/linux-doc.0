Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191FB35CBD6
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 06:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774248940; cv=none; b=kzT48UJNCYOPtMWnr2C9hGikQ4PxuBGS3M2GDv5+hVAobtjh/h5GOSc4d9P7tnoxWUjxEc4fAEMa775yQ67tll5rz6cNfPwDFVgpK3hvGbqp4E4ZwJayMgUsiDBCklTW0ww8gJesR+FEnmzsoH1NHiVQRhBoyGrxfVFXdeRCxZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774248940; c=relaxed/simple;
	bh=vZrXsbPeGeCkiMIqLDbuiKx8v3tlHBlMlQKRAhMixBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubDaAdALvEoQtPlhK9VcqylL3mQUQWN9GRuOxWXCP+jQfBUNARpgXMcdoSoiWjwdMFzh2ySiTpbu15Url2wrFgAoYcttYDjb7+NjXjI6lbWrTDNWKq3lMekhiRGdHSmwGkgdeZWDaD74no2yiIdNEKU0oSu8Ulg+DclMmEgLneI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SaOCMMOt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=r5Hzpd5i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SaOCMMOt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="r5Hzpd5i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774248938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cUFvGhq55JONPygTQtBYsqFeVViX1eQUM3HJHzaMYXs=;
	b=SaOCMMOtP6rrCr9XSx7byEPy3Nd/aKMwApoc3GVQSLWxanovorO2pk+LSimm1QpO8iYIKE
	F473zJpcEU18MUrFkL9y/Dk2wrzKnzb0rukZx1VboZ69qLprRAANM4Ot00kj8TIDcKeJsS
	M6p4CDKnRA2JtuR/iwMVDp8FEO8l618=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-VvbOcARANniQYidw-zJfyA-1; Mon, 23 Mar 2026 02:55:36 -0400
X-MC-Unique: VvbOcARANniQYidw-zJfyA-1
X-Mimecast-MFC-AGG-ID: VvbOcARANniQYidw-zJfyA_1774248936
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7385a1476aso2851176a12.2
        for <linux-doc@vger.kernel.org>; Sun, 22 Mar 2026 23:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774248935; x=1774853735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cUFvGhq55JONPygTQtBYsqFeVViX1eQUM3HJHzaMYXs=;
        b=r5Hzpd5iUWCnyDdTho7paarCU2nRJbJ2VSac2D5aWpb58IuYNtMwbMwACcig0suyyI
         x+ZHUc/gysMsdn0A4ESYZNvr6sCAKXQ9EodP3YuHWNAZkASGbfTPniR9gZVKaDnZtSiJ
         xb6vq4U9UnlELZgJ9T0EXUwjRoHQtmqrAlSerO3aLII8RMOW1Jpr2hg0AyBSxMByPVhm
         H4Sc5xAnUdSoWgt9z0k/AlJxMB+chqXbgZKCdpxSu3Hw06vbnmDEn9UTAV24XcLB6G2v
         i7VIACnddeDzN7zz9V0xokRtWeAJWfNWBLoM0DRypHKNgEaExEejYW7lDRO1MpZ/m2eE
         JXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774248935; x=1774853735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUFvGhq55JONPygTQtBYsqFeVViX1eQUM3HJHzaMYXs=;
        b=mWnx8sQhauOAnMWs91gpeRWfeVl/TK8Il9moIqGZzks5jIEjqpxooPN3WAPlbgUPNe
         AnvaVJG/ZsylG5etM0vYUoj1Yo33nW3htFbSusnI2rk41TaIM02WDy8aYp1Fv/3hfKue
         uW1AwZWSX8BRmQxx3FnDWOP5TknftvCuDOA6T4PpensSav7ZOgsogCpEomHK9CQ8di11
         WeAiOPrNytK/ZI8c5/13aVfXXecdKnWml+NZcJBLbFZjQ1NH6xvtalO07d8axMfbRadZ
         4B7dKna34acuHJPsREkn4jqnNMq4zTv1czCwmt2l1st+a/M4GUsYco28dwjNNdJrhMpK
         /WDA==
X-Forwarded-Encrypted: i=1; AJvYcCVgrylGnBInhz2k2BI95IVEcJz532eLp8sa4O4SIXQHQkLwUTKdYIGJX8vaZL5ViyTswFupL0klgxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YygBpRszNTMwddHmFsPyXqzSv9eGsuunqtj1d+qDyIpPY49i8Kn
	6XGTOfvcjjrfwhZj9h2UsTi694Nk9GZrvRNo9DYBF8x5e1mPLooT+D4iar4tyXyUD+iyQ/TIp8F
	Q0OjyKPYyLSYdnM4rbgugD2G8Og0j1rKjv1H9w4hjCAR+zutJlqfdZMhInKrsFw==
X-Gm-Gg: ATEYQzwVA+Z59HxDgBDtcjFKtNK18YbxxQ7UOwMaOnxSlwsx+1Z7Zy5IzCIOgQeybdF
	sOOhwTLS7pWbN0i5LCCDxSPo7t1CWFPgL2gAB6n7a6078DK4bIuyAWCQDlmey94K3phW0j0jHuE
	vIRNd+xBPfAIBJVyolBQ6O+AuIYMKS5NSben3Fpvc7glvnnbaSSH+F0cEkPGRZNtef7cLGLZJIn
	Heh1TDs6MC/925RUGWgSVMn62W4l7YDU0z5HZ8nzycP4ZHft5HXGCDbPwYYITYCdX0r0mE8jUh5
	vNKX/bt5cIPec1Zm7slxUJL8iN0gHV76Z51pKloEAnWdDjm02mcQG1G6gv1Tl07CvnDH0Bqenjf
	pu1fkRn+oEZXJEJbcsGeCbbfG4VK2FA9FezOjFa2OKP45DQoX/3Pfz9TBo6idboKI
X-Received: by 2002:a05:6a21:3286:b0:398:7e12:c03b with SMTP id adf61e73a8af0-39bceb41272mr9670983637.44.1774248935568;
        Sun, 22 Mar 2026 23:55:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:3286:b0:398:7e12:c03b with SMTP id adf61e73a8af0-39bceb41272mr9670964637.44.1774248935151;
        Sun, 22 Mar 2026 23:55:35 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a7ff529sm6924198a12.2.2026.03.22.23.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 23:55:34 -0700 (PDT)
Message-ID: <670cca31-ef2b-4fd8-89ad-221526a07f7e@redhat.com>
Date: Mon, 23 Mar 2026 16:55:17 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/40] arm_mpam: resctrl: Add plumbing against arm64
 task and cpu hooks
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <20260313144617.3420416-20-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260313144617.3420416-20-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/26 12:45 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> arm64 provides helpers for changing a task's and a cpu's mpam partid/pmg
> values.
> 
> These are used to back a number of resctrl_arch_ functions. Connect them
> up.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
> Reviewed-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since v2:
> apostrophes in commit message
> ---
>   drivers/resctrl/mpam_resctrl.c | 58 ++++++++++++++++++++++++++++++++++
>   include/linux/arm_mpam.h       |  5 +++
>   2 files changed, 63 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


