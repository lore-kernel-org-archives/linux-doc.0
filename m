Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935883E0080
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 02:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788748047; cv=none; b=B9ypSJI1WfUdDLuv2+7l/YY2BV4a/GKsmaJsV7pXkyHnNS/u4hsMwsToExAvGsokcX5fBKhhLgxKtyF3d4hRf1Nt/PuaFIwEaifbZddR8k4yo33LmextN6Q5PMgq3krVpumOHcBsrKFZ3OyPK1Bs18LAl1AJDMemIUU0PtS8XBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788748047; c=relaxed/simple;
	bh=rP1oA0DxmfD1YAjhh15xGLfb3DU+susYyuxibGkWvEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YmHA97ZV6iygHZjDJRwA63V2a1DjdScP8sianMD8plMs5xoNqtQC0LggOiwWlaGHUXkAyq26JrjpNG0ZE60w2jqonJTNkZiLCO9uSoqq2zEkEaX3tOsQdPfmETmSGFR8J7bDsLJF2gjxnPKBAg9XOQhTaE7KL5BRWVumPez2i5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+y7BKTH; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+y7BKTH"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso3822997a91.1
        for <linux-doc@vger.kernel.org>; Sun, 06 Sep 2026 19:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788748046; x=1789352846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hK6rznH6sZmMYoIVp7jSpppx7B+6EUkEUbPHQbE9BCY=;
        b=i+y7BKTHoRyDHL7Sd2S9TVahcci0DXhxZAUOP3A++MyebsgzrxOPBufy+4+SNSW/z8
         6lJFnHt6fhD1Ezpdo8Vs+s1UTz7UHiGuNxYETeXKk6w1pY4k/ebK13qGKPmHrWCLR+xQ
         bW7moEKX0Zt4STW1R/gRLvEkARnfrTXuB+wZtJB1aBoGsQGaw5rl3p70wdNCcP/LWGrI
         bPaxFuwmBmA5vDK4avDlUfi49zFXFIFaZlBzf3o0E4Bks1w1BMw2YGk2emH7IxyYN3Tz
         3xiQuNT0pjj4/FcL29ttnYlkfvK23sSXN5GbTwL6lPdI1xlFSqG9WTmiBghvli/Oa2Ul
         H5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788748046; x=1789352846;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hK6rznH6sZmMYoIVp7jSpppx7B+6EUkEUbPHQbE9BCY=;
        b=gKvUMEYp3IxtjYKAyu4JfQP25Q4NoLnKZavmDqUocqfZ8UY0pjPABDjN+cag/e4pL/
         bLqcCh1RMIuOPYGSD0H9tfpSafCc0k2qWprm6Bm/osGZ4aX37fSEtA9a3TSn0JjBzd0F
         2DHmi/r7UWRQDOcCME/36OQyoMU1+yvmv6exN5STEcIAMegrTr0tgOKE/89EGXWj+tPr
         3WOZ/NGRZE4xXL8p4iciT+c/LCdiIkmIs15CqVABHqjVR9VBmmaZPXNfbOTisnutwXTI
         lHbP17dCO/kQ23CTgJsynXorfxUYAP5nKVe91/IdduIhG/KvMrgaS/U771UDs4OLx2kO
         mwxw==
X-Forwarded-Encrypted: i=1; AKwUvBxk3+SzDmA5Og9SQokXF39XIdYUm85PMFvDlncOT9twzI/N46IjEqq+B6opuS25Ugv72A2ffxxWy34=@vger.kernel.org
X-Gm-Message-State: AFuF++mkppl8w8Wrlp5pK9vXebzO2vOWOnHptyCwnvgfoTtzOCrPGohA
	272jbVSoSlU5Lsm6IfDJbAbqJxpAqc/GfRs31fTCe5OjrOfpfjmo5FAm
X-Gm-Gg: AYBFou0xk9trJBx8nfr26oDj1HW3Vk0ImRHFt3nZeAWAtVgn8ctIORZdKl8KtiobQ4o
	SCqBm/4iO65tpdLd90cb0cglFLvcwNrrOJA7fPbx1rtm5VUe/89jTIw/a01PY3cdhxa0DEOPPru
	Dr4B1uEYnljH6X1oT3qYteQmNud+F6B/FCCu9n5OtGo1PDw/5pZhu1MOTaNkeb2gLH1Ibp8o0SE
	vYc8ve4cL8WBEBGkgCXSMWajdi2UwVPzMxU2zGavCq1v3bpHAnxy5wy2lC0uFfK7hjqeeqCmgRa
	A10bI9NXWJPhuyhQj4pxc3yTLCgw3Oll8vCkY5dR+0lJfRW1CneC8D52DiD282+LvMgCaY4jg8q
	WBTVZbId8d75V04F3nBlV8pBaxGMsY5+9T3sYKE2RU22//DLtZIvIgN8jXx3sn2pJb7mFiJYjPG
	H+XRqrOTxCBTUHE4N4d5zgM/qRLKjEBF8ZREro0V4vSCCuseTInBI6cDqoTp/5IkSZrVYC6p1u3
	T5d1fAsOPvVTFE=
X-Received: by 2002:a17:90b:5844:b0:398:e436:370 with SMTP id 98e67ed59e1d1-39b260ff0e9mr32411991a91.2.1788748045768;
        Sun, 06 Sep 2026 19:27:25 -0700 (PDT)
Received: from [192.168.2.166] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b07b197a9sm23626169a91.0.2026.09.06.19.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 19:27:25 -0700 (PDT)
Message-ID: <33037304-19c4-4d28-a550-b0b45a560f55@gmail.com>
Date: Mon, 7 Sep 2026 10:27:18 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] docs/zh_CN: update DAMON documentation translation
To: Doehyun Baek <doehyunbaek@gmail.com>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, SJ Park <sj@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 damon@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260818070358.455768-1-doehyunbaek@gmail.com>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <20260818070358.455768-1-doehyunbaek@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Applied, thanks!

On 2026/8/18 15:03, Doehyun Baek wrote:
> Bring the Chinese DAMON documentation translations up to date.  Update the
> DAMON design and administration-guide translations, and add the DAMON_STAT
> usage translation.
> 
> Changes from v7:
> - Use the suggested translations for the DAMOS quota goal ``nid`` and
>    ``path`` descriptions.
> - Replace the remaining "聚合间隔" with the consistent term
>    "聚集间隔".
> 
> Changes from v6:
> - Clarify the DAMOS quota goal ``nid`` and ``path`` parameter descriptions.
> - Improve the translation of "offload" and fix the duplicated character in
>    the non-access-pattern filter description.
> - Consistently translate "tracepoint" as "跟踪点" throughout the series.
> - Consistently use "监测上下文" and "聚集间隔" for DAMON terms.
> 
> The changes were suggested and clarified by Dongliang Mu.
> 
> Doehyun Baek (7):
>    docs/zh_CN: update DAMON design translation
>    docs/zh_CN: add DAMON_STAT usage translation
>    docs/zh_CN: update DAMON index translation
>    docs/zh_CN: update DAMON start translation
>    docs/zh_CN: update DAMON usage translation
>    docs/zh_CN: update DAMON reclaim translation
>    docs/zh_CN: update DAMON LRU sort translation
> 
>   .../zh_CN/admin-guide/mm/damon/index.rst      |  15 +-
>   .../zh_CN/admin-guide/mm/damon/lru_sort.rst   |  68 +-
>   .../zh_CN/admin-guide/mm/damon/reclaim.rst    |  82 ++-
>   .../zh_CN/admin-guide/mm/damon/start.rst      |  63 +-
>   .../zh_CN/admin-guide/mm/damon/stat.rst       |  94 +++
>   .../zh_CN/admin-guide/mm/damon/usage.rst      | 523 +++++++++++---
>   .../translations/zh_CN/mm/damon/design.rst    | 667 +++++++++++++++++-
>   7 files changed, 1345 insertions(+), 167 deletions(-)
>   create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/stat.rst
> 
> 
> base-commit: db6ed2a3d31068ca5577466591b2521dee0508ca
> -- 2.43.0
> 

