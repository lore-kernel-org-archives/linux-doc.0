Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5ED3B1EEE
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 06:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789365783; cv=none; b=tuxBhUC9d450Hah4rH+Ak6CsQ3Z3rLOvsa2Sz0W+PlMXs5X6romuoGcU1EZhiUfv76GjI93cZiCX0PzKh0t83HtRaDOYL8cf0NtYPO4XbFtTjUKCQrat20VVFUsPcVSmgPWFeMQpT3bFS9W19c+f2iO1OytMspxY1suw5pM11Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789365783; c=relaxed/simple;
	bh=Gv7lORaDNCNghahgjKYq5FlxBpKPlgY3TJoQDAGQytg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ci40nw8YwdWsaWPgHP7zapPivY5okJMnTqY0KsXvjIEYDWgWZAlX9jMNJarRdOMUS9PMxXYqioQM3K2aKjMg4lmeDh6fLaGT+7AIH0YKWL0cIDG9QouwUfDOAnKCIHZi4jwY6988/fdyqMkTgvoqeMAb571fKA5+On57LkVWHXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cCR6IPKT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=n/sM3TBx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cCR6IPKT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="n/sM3TBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789365779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pqstWO1ZgVHH8TktNFCBcMfA6S7qInTZbOl2DmKbnYU=;
	b=cCR6IPKTc8fei5HXb54jAz239QyvJtvAWI/ydViu+hwAT1g+i04wY3XPq8K9lg5u5YAC7N
	Us26xzjOOqHfxuCfMka4Ua+1fjFN0sioB5ZlaP3GHp2OKfJ4KqZmysCslpGJtuyDsJ/YRx
	oNfTjY/8mjnxNiKPTC48d7iOCM/p58M=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-0neF8W-aNEC5XG5wt-_FYA-1; Mon, 14 Sep 2026 02:02:57 -0400
X-MC-Unique: 0neF8W-aNEC5XG5wt-_FYA-1
X-Mimecast-MFC-AGG-ID: 0neF8W-aNEC5XG5wt-_FYA_1789365776
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1a3f01d2aso4206301eaf.1
        for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 23:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789365776; x=1789970576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pqstWO1ZgVHH8TktNFCBcMfA6S7qInTZbOl2DmKbnYU=;
        b=n/sM3TBxn/n8f4by77c5V5AElTog9dUDPL3WH4dpbVzMQzwdXlLkK3OzMaqusOIpL1
         6sbeSfHyBPtogZE1l+mginjBuga86IBuMYi6DeslXZ1Ju73LATZs+gvHx7sxW8KTPe4W
         ZVypHgSzEwA7oNR6ZSdLaNiVyRLhUjnPSeh3oJ2NXEWHZgEurNXCOK3dZgRagH0pBvDp
         2H4y7ifJwH1OrWqc/WInmKPMek9NUFD+YuqgQ6ywMcZjVrB4Skv4iccvEsxputY/qbQT
         KaWhct6i4mGG8xR2iwAiCN9hNcqQtiix1l81tMszyMPU/wLB/TJ8Q4oWY5+Jz7EMCVD7
         AqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789365776; x=1789970576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pqstWO1ZgVHH8TktNFCBcMfA6S7qInTZbOl2DmKbnYU=;
        b=dn79T94CAhcN7eu3E1OzEbsTOiFLt5sl9bZDekQVjWcDuod9GEgUHoCKFw5YPcpvZY
         I0P+oHPHdu+gL4upc0K5iyBOxGEF5A/DqWctSSJaqgrMFh+5d3tZ5hpKoewysWN8k9px
         RXBwj3KCKZbAg0nmsot8QA4y406vw4li3veTb5UwbQyliJ2RGuugrrS06L9GvgotGcjM
         nfk2X2fm8qKZOBziY6ENanUrTZJ4bg3nTAwkrBJ73g6e3+VP4Cr96m5tyHLBoOUEjPUs
         CiiPkv7ctJaTYpPbG1unCVOGGWzVF58WEy6RTQuhRtoEkgk0MiYvfVf2zKc4gtqFn+Sd
         jAYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzY54EkzcnR1os2nQRsuCrqFv0L/HIWVj8anz5OW2zBmpcdZK/0xbdlfIh/wmb0/jjN8F29igpcJdw=@vger.kernel.org
X-Gm-Message-State: AFuF++m99OxyJhcldCiSjc63KIVflDt5rI96gHTgdr0nyLL5JE/sujAE
	JutDmFRyB9i1fKCZuUKMIv5fs5mszWy5v+GSgB0QI5u9p4qnl1fNcIglljqk7gFlSn8bVJI01o8
	hM1Tk2xOmtRu+kPvuS+QXbynPv4mlz6+SUxTwOhtsPIsgXpuxlpmxHvy+DMOwYw==
X-Gm-Gg: AYBFou3Is8iwVvatnkmhqUxfDtH1mTmOtin2xk7vUkvtu0dYdbGv21AeicW4poZet1r
	vRf7yjBgw9DP823/uSrhBQhJ1X7AOwcKG9IUp8dyS1re3eFxWn4FjR8iuCLxYGzq6ah7kbg+XCb
	j0EZonjsgjeKQBrPvNq/XlzNcsnylPuB12AemZGgtHi8SerBN5bUf+JsqcutMEETrwF87Uypfbw
	Dp7tGC9Ws5Kn9FDmhXWxFfPUn+WyD+ew9Ly8Rp3skaitkAqt0eFt1DIFvbwbd5w+qP+QRJbovzl
	8CGdQWqcF5ZWmBqEbBRyx85VIWdMTRLJGzY2t/fDbcG1Oy3mLJThG/mh+SJIgF6JkiZX5A1LSFu
	poHnc8xU9696jUayzHqQq57eQALqEC+x9k6GWwP+WvA==
X-Received: by 2002:a05:6820:985:b0:6b7:46fc:1e6 with SMTP id 006d021491bc7-6c542f1e27bmr483589eaf.69.1789365776254;
        Sun, 13 Sep 2026 23:02:56 -0700 (PDT)
X-Received: by 2002:a05:6820:985:b0:6b7:46fc:1e6 with SMTP id 006d021491bc7-6c542f1e27bmr483565eaf.69.1789365775779;
        Sun, 13 Sep 2026 23:02:55 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143659a9a06sm23239081c88.0.2026.09.13.23.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 23:02:55 -0700 (PDT)
Message-ID: <37ff6cc7-9a72-41df-a473-b45803ad5239@redhat.com>
Date: Mon, 14 Sep 2026 16:02:46 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm_mpam: resctrl: Add pass-through
 resctrl_arch_preconvert_bw()
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net, x86@kernel.org,
 linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260911163613.1131447-1-ben.horgan@arm.com>
 <20260911163613.1131447-3-ben.horgan@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260911163613.1131447-3-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/26 2:36 AM, Ben Horgan wrote:
> resctrl rounds up the percentage value of the MBA based on the bw_gran. As
> MPAM uses a binary fixed point fraction format for MBA rather than a
> decimal percentage, this introduces rounding errors.
> 
> Without this additional rounding, if the user reads the value in an MB
> schema and then writes it back to the schema, the value in hardware won't
> change. However, with this additional rounding, this guarantee is broken
> for systems with mbw_wd < 7.
> 
> resctrl is introducing resctrl_arch_preconvert_bw() to allow the arch code
> to specify the conversion resctrl does to the user-provided bandwidth
> value. Add the MPAM version of resctrl_arch_preconvert_bw(). This does no
> conversion.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
> Changes since v3:
> Parameter order switch (Reinette)
> Add Reinette's R-b
> 
> Changes since v4:
> Add missing tearoff divider, ---
> ---
>   drivers/resctrl/mpam_resctrl.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

