Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54E0349CDC
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 11:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778583777; cv=none; b=QGFLo2apSXOyyU4VI85/n7pkXJMp8g+razHYwUtnJ/nJfida0DqERFn/OP5F0O354Mn1fArOOlGiOFhg5DU93444LxGX12+fdVhVFnfb6rS5bMkrBI0TmKRyr9uwK/7qAhEYAifQj5To+khYKv2GrYEo+vHvfrOmfjjtSlTHlew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778583777; c=relaxed/simple;
	bh=Ga5JPf6n1jpdDjVA+pd1zKMfPwv8abcvqFDXHuktbVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C5LiTRzaTWankdcfGlruSMAGfjsE2XU3qfwiglCFhUvyAj6frAlWRkRfJFqJnPv3LuWmdP7BHekkMSOuiXo2X760Gc8iiofi+n9oBt8u/UspOxjnfjkLnoOwjhgZ54ha0YQkJqA+y5gZvfb/tbMmjvFR2OmFTfI5Esi5gw4DPxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMGI6aSI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMGI6aSI"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891f625344so50486435e9.0
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 04:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778583773; x=1779188573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FFGUETPgm26h9XFyqe9suVV5/326pTXPraqjVQBHotQ=;
        b=CMGI6aSIa1QSUGEppO5DZE5bStYL/YvJxZ/qJsxprMZcqpr8jjcRldFTgDdmLikjRE
         3BnhZVQ38O8BBjeXER+GjcK13KWR8cV5Tp/jEfXjg+EGafjTy4NmUt3qe2tSG2sLzdMt
         +RWW76NNBeEe4ZR1P5NHKWyUaTlbPZDXLFkq6UEBFkThTiH6vzhf0zT6YtiUeAqvWzTe
         yIA/lz68/8Xbwmz9hW7HA41UF/9xcIqS6nlFjjKXFZXPdZjXTSgTN0XaPpsO5IxOaqF6
         u2ItGLIvsJhnqkeJN0wFNvCnY+cJGITxtre4L9T+lf6IN6JXzImjg4Cnpslix/VXYglj
         Teow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778583773; x=1779188573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FFGUETPgm26h9XFyqe9suVV5/326pTXPraqjVQBHotQ=;
        b=DMXAJypo7UpiWRmEpcD0l1VROWQiflr04YZ0NgbzdQZ2H8yA5FEWRs6Jx85WJzbqYJ
         OgMOfTCoie8lwu5/cOv5rBjcHldiUJ3h9P9qPib93GlyWeVRB8pNKJUTuB3qF5aiX6Cq
         x6Ue/DWM7PUFu1kcX0J0rFenyQIFf7e8KY85ePoejwasF+BpwNAMVTO/2VnBEgiKJQtS
         EzqIRRaUSQ2Ui2i+XIegk/87tlf/pkNNWezeAP/fmqfviXY0qBbKXswuP7CJ18CG1QPc
         nw0+8HrA9WtZ9k1XZEkC2Cw1CqR4R8/FjeIxfGhrVYCkT+/4LB3QAUwyW2F7fOGZeW3G
         FzXA==
X-Gm-Message-State: AOJu0YwcTSWmo/0PMhZkwZmqL2aqP5Y0hNNXtYrJFGGJkuBgDuaPCpOB
	qvr0XjGT0yUIIB1BbB9TS2fpmxYVeq1gPYnAK0ok85nPNKkoot9qCEsK
X-Gm-Gg: Acq92OGCQwdEumL38P2zyiTKy4Rkzk7INQF6nfPhGQDdSnfiUjexZTd/s+u7lpg2m27
	ppJAANmBU0kwKh3QeZcUM2ej0UfILEIuEfJpYmN/t2bg5I15TZvkooohqIYYj2AACYazFi36fy/
	4xWbt59Sj79f2u01Cq/imVbSIZmMn2brcgmHBtuLbJY5iEH9ffiOTrwxz/BqrT7055o+euclCcc
	JXgiHGLrxL7fEIYENMSEQ/H6VhVoQT2NlIJedB6VwmHycdYXVM3Ja8rc+eVoJsces5rRBBcDsjd
	+/TU8gqUqmjD45S2jnnCcFPa792OuD54yrHZw0o1vOgTMYTrPazk6dmGO8V8Ew/SBKHJZQV6rpG
	Tq+mnueyObOYR95ScokqgIe8PpVbVuDqzPTPu31/4dGiHf43oxzt5c6PaGwn7gX/37vaj39W73o
	LXVMD/Fz6pW6WrBM3s8WKFkpysa0Dv/o/f0u2Wok7hvIoWaSHC3h3AzPnJm+x05sOZiY4km+Ijh
	OF2BtxYO3vL/sZw1xm+TDKOKhX6i9U3sDck868=
X-Received: by 2002:a05:600c:46d2:b0:48d:50a:6ef4 with SMTP id 5b1f17b1804b1-48e8e210753mr44805285e9.11.1778583772968;
        Tue, 12 May 2026 04:02:52 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325::372? ([2620:10d:c092:600::1:8c90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3e174fsm23962585e9.3.2026.05.12.04.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 04:02:52 -0700 (PDT)
Message-ID: <539e235a-2027-4bda-ae26-00200c53cbaa@gmail.com>
Date: Tue, 12 May 2026 12:02:46 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] io_uring/zcrx: notify user on frag copy fallback
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>,
 io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Vishwanath Seshagiri <vishs@fb.com>
References: <20260422112522.3316660-1-cleger@meta.com>
 <20260422112522.3316660-3-cleger@meta.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260422112522.3316660-3-cleger@meta.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/22/26 12:25, Clément Léger wrote:
> Add a ZCRX_NOTIF_COPY notification type to signal userspace when a
> received fragment could not be delivered using zero-copy and was
> instead copied into a buffer.
> 
> Signed-off-by: Clément Léger <cleger@meta.com>
> ---
>   include/uapi/linux/io_uring/zcrx.h | 1 +
>   io_uring/zcrx.c                    | 7 ++++++-
>   io_uring/zcrx.h                    | 3 ++-
>   3 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/io_uring/zcrx.h b/include/uapi/linux/io_uring/zcrx.h
> index b8596d7d47b6..e0c0079626c8 100644
> --- a/include/uapi/linux/io_uring/zcrx.h
> +++ b/include/uapi/linux/io_uring/zcrx.h
> @@ -70,6 +70,7 @@ enum zcrx_features {
>   
>   enum zcrx_notification_type {
>   	ZCRX_NOTIF_NO_BUFFERS = 1 << 0,
> +	ZCRX_NOTIF_COPY = 1 << 1
>   };
>   
>   struct zcrx_notification_desc {
> diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
> index 35ca28cb6583..732e585aa13a 100644
> --- a/io_uring/zcrx.c
> +++ b/io_uring/zcrx.c
> @@ -1510,8 +1510,13 @@ static int io_zcrx_copy_frag(struct io_kiocb *req, struct io_zcrx_ifq *ifq,
>   			     const skb_frag_t *frag, int off, int len)
>   {
>   	struct page *page = skb_frag_page(frag);
> +	int ret;
> +
> +	ret = io_zcrx_copy_chunk(req, ifq, page, off + skb_frag_off(frag), len);
> +	if (ret > 0)
> +		zcrx_send_notif(ifq, ZCRX_NOTIF_COPY);

We also copy the linear part if present, depends on the semantics
would make sense adding it there as well.

Pavel Begunkov

