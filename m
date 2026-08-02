Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1972D780C
	for <linux-doc@vger.kernel.org>; Sun,  2 Aug 2026 19:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785699423; cv=none; b=uuGyukKnUJOe66K6nkssmXQ1W2X8rUGvRcETsWBz9eugFP/aBz+onMdLQRWOdePyKa8gtSLUeuit/fs3gOmm7IKTrM9rZhoxVFuUqCeFun9EJ5sqJRn4kigTkI3OToPYng/vSosoEq4ztf0isnciIPZwGYOHo8PU+JvYJTNaNuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785699423; c=relaxed/simple;
	bh=ZqYWuNH//LO3FokGW0fyXyWjvIw2auoD5pYZK6nO6yE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EupFLU88pNC4RG4uvKKII/R8e6ytNpsbzJzRlCg1V+IwTpcLj335Sxh0W5HlyOZngb3ha78fGSIHJ/xO25tsGTYJZ15BayUQQfDi736DlOd7sgzpjX4dFwJE2So0xmpkeDe9EZElArSxDlJj/G5tcQOnBZGtRqGmmYSW8+84Buk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYfK6RdA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYfK6RdA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49548e01d02so7384945e9.0
        for <linux-doc@vger.kernel.org>; Sun, 02 Aug 2026 12:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785699420; x=1786304220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NdZSS5vGVZ+3L08ORIN7DlHiekbSHxMfER6ayOjdWgA=;
        b=WYfK6RdA1pSCIKyuokfsCerRP0CD5BoBrQ2T7F0svRfvR+vewbL7vzufKvoKUDFoZ5
         MyC3+7ds8HBil/OnMrV8Igl+HJzw1l1Ohl4RhNyfcCzXktlsf5VoseyosQGKH0Ps7V3i
         Plet8I8f46UhQQwGCnrFUVm9lJvhCjhXLIdA7CZnYfq8pzokMiBrbNFbVn3OCLeC5A25
         GaBuB+6N/cU9cLvqGSStP8sU54e2qeM24NjDv6mO1T5cRRCytUBGMtqF3PEVFIv+YT/9
         pOEb+N+6JLbfc6XoGZ6+PKIgm9l2H6wAegP4LDYHcIy8KnQoGbRxB7qLad/rPmsNpxsz
         WGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785699420; x=1786304220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NdZSS5vGVZ+3L08ORIN7DlHiekbSHxMfER6ayOjdWgA=;
        b=iqVn2I7BJqAwSsnVlPnr1Kojs9UED984ruHGC3XJwGd60K4pk3l3Dvdvm6yl0qR+a9
         RgvkWUcYgD0pbV2E0aNXysqp931gvi9B3YD34eWvvMNlgu/Po0GMjoj26xMBBy0HRngA
         f2lcM3NclLaLu6izP8FGCvRxPacQXYoq/u1VaXXQyK3nPLQAGn+tBCocpu7spM6Aex3Z
         +W067vyFczbVGrDgKujug99fne1yUAQt63LRy4G0WQKSX9xdg028V/62rAkAGUWs0/Sp
         wybrP0SJB+EF0mlzHg0W9h3bxXXTNjI3fbLFYbMnxVkG1aW96qunnbJVx1AA97r7K4i3
         fV0w==
X-Forwarded-Encrypted: i=1; AHgh+Roxn+sWkPFSGdskS1+K+XF3qMfgbPoFdmfQFJaOyNMM+VI8k+ePzo6BOz3mxVdwLJ85o0giHGGHrto=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCydA99YRAYTbz+EWg+Oz8aFNkeM3zKbRp+PmMua48cxNNYBik
	WSFKTa9UNjjlRoGK9bRknzpwvOnMI1PADHf/RektU8TH4AadGvgScYwq
X-Gm-Gg: AR+sD12q+sxzsmPjElnbLye2vXfvQUr4Z1K2YPmZ4nqBjMHYSXut374nAkeVtcZ01WO
	4zbNksKEvjSF7PMAAs45uWb4VMhPjaRQs/jNoXMsaIYoUeYSVcrUFllYclShCG4NawT+EEHOwWM
	PFM5eKJLmZhvbUWxOxLdCAiR8lvnJx3fomAD6rT3u+e4FUB6V95Kc4qXGjWjOSb0AemkOM97DLy
	SY/Sl7AsxtyhEYPtWFWvRmQXE+GZszYxM39v41BqAZmZd2kSLRPmW+inX5Jq8gCETW1X3oycz2c
	Wz8mT2UHaEDGPaTFZaTdt9jhcM4hIEhzLU8+mtXhlH2B8wxWC66eMdzj5uIPl0qT/+RWvf4pXbI
	mpRMIKUOS9hucGr271S2uKcpQXts30YD5EGm7JfwFR+ceE0bsRvhRxd0tzO3VhtvoS00JUgh8Hz
	r2nJVzpaG/HhD/zHMgP+05ToMjIke6wOveHAiEe4FysOuIXAoZgojJ1J1MtH1EdJHkeqAVRaCfx
	VYvE+6CHNfRwn5LNxX5+idsAejUcBsPmv4m+c2DjB9IMMdpvKss8zCcWdybONYWgVU=
X-Received: by 2002:a05:600c:1f83:b0:496:c18c:f9a1 with SMTP id 5b1f17b1804b1-4980c6778e4mr124116015e9.14.1785699419788;
        Sun, 02 Aug 2026 12:36:59 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807eb12c5sm97180375e9.3.2026.08.02.12.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 12:36:59 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <30650585-9d4d-4771-af7c-7c3908281719@gmail.com>
Date: Sun, 2 Aug 2026 20:36:58 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: warn users not to use select on choice
 options in Kconfig
To: nathan@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 arnd@arndb.de, stefan.hengelein@fau.de, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, nico@fluxnic.net,
 officialnaumansabir@gmail.com, rdunlap@infradead.org,
 vegard.nossum@oracle.com, kees@kernel.org, tj@kernel.org
References: <20260715220149.48700-1-julianbraha@gmail.com>
 <am-W4tuI0k7MKXVP@levanger>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <am-W4tuI0k7MKXVP@levanger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nicolas,

On 8/2/26 20:13, Nicolas Schier wrote:
> On Wed, Jul 15, 2026 at 11:01:49PM +0100, Julian Braha wrote:
>> Hengelein's master thesis about Kconfig from 2015 wrote that 'select'
>> does not work on member options inside of a 'choice'.
> 
> is this true also for 'imply'?  

Yes, the same problem goes for imply. But I didn't find any of these
'imply-choice' instances in use. Of course, if we're going to warn /
error for select, then it makes sense to do the same for imply.

> Adding the check to kconfig seems to be
> pretty simple:
> 
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index b2d8d4e11e07..149d3ee59b58 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -287,6 +287,11 @@ static void sym_check_prop(struct symbol *sym)
>  				    "'%s' has wrong type. '%s' only "
>  				    "accept arguments of bool and "
>  				    "tristate type", sym2->name, use);
> +			if (sym_is_choice_value(sym2))
> +				prop_warn(prop,
> +				    "config symbol '%s' uses %s for '%s', "
> +				    "but '%s' is a choice value", sym->name,
> +				    use, sym2->name, sym2->name);
>  			break;
>  		case P_RANGE:
>  			if (sym->type != S_INT && sym->type != S_HEX)
> 
> which currently reveals
> 
> kernel/time/Kconfig:136:warning: config symbol 'NO_HZ_FULL' uses select for 'VIRT_CPU_ACCOUNTING_GEN', but 'VIRT_CPU_ACCOUNTING_GEN' is a choice value
> drivers/mtd/maps/Kconfig:104:warning: config symbol 'MTD_PHYSMAP_IXP4XX' uses select for 'MTD_CFI_BE_BYTE_SWAP', but 'MTD_CFI_BE_BYTE_SWAP' is a choice value
> drivers/tee/qcomtee/Kconfig:8:warning: config symbol 'QCOMTEE' uses select for 'QCOM_TZMEM_MODE_SHMBRIDGE', but 'QCOM_TZMEM_MODE_SHMBRIDGE' is a choice value
> 
> on linux-next, with the NO_HZ_FULL also being addressed by Julian [1].
> 
> Julian, please call out if you want help for pushing these.

Thanks for offering :)

I actually detected 5 of these across all architectures, and already
submitted patches for all of them (thank you, Arnd, for all of your
help):
1.
https://lore.kernel.org/all/20260729203845.387239-1-julianbraha@gmail.com/
2.
https://lore.kernel.org/all/20260801160140.2391000-1-julianbraha@gmail.com/
3.
https://lore.kernel.org/all/20260714112047.2304856-1-julianbraha@gmail.com/
4.
https://lore.kernel.org/all/20260723104933.117413-1-julianbraha@gmail.com/

With #5 already in linux-next:
5.
https://lore.kernel.org/all/20260723122818.437802-1-julianbraha@gmail.com/

> I am considering to prepare a patch and add it for kbuild-for-next (but
> not to kbuild-next) to raise attention.

I think the Kconfig interpreter should completely error out for these,
but of course, we need to wait all of these patches to be applied first.

- Julian Braha
