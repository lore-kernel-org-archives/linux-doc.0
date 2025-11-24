Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E624343AA4
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 03:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763954203; cv=none; b=C5auQWkxGjmhl/91siquW5LIYUlGMAA9UFfkv2WqZqejypgunI0GFYZDG2GcgeGaFekOxb7Sk6lOX5OkFqPS2wTStNSORMnU5N/hLahyV5nlHGNS26bB4k4CM43t9iqEv4iS+Y9dqUzp4J7nx5w8XRNUP4xm9rUa5Unn6iHQmvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763954203; c=relaxed/simple;
	bh=Ufhtjp5u7Pkqbc2OT0mjv+rD9SRL5OTdGVJGSwd8UZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CS4Jgym85KnAODuBdEClWesqvktDVlGBur1cJzF7MWA8FNHYIIHNHzhEz2Fx31jW2XT2J7ke5JPmVcXIuW8tJ1opkr0GsAk7XGg7ZwgYo5cZPWGKq0Xw5rkz8YUcNgsfph3f6EX4MayW1YbW7bjO1L0YPzwlq0YrgMY3SwQE4Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQTaGcCG; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQTaGcCG"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-789524e6719so48879487b3.1
        for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 19:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763954201; x=1764559001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZjyVN0WFpD6zel/1SQcb4kWsuE+t0YVPz778/EfYDIs=;
        b=kQTaGcCGIUcU8eb8TwPKQRFpZPJ2ogh0UVRs4h90J3RvkLo7UhKPYIZPg5wHRt5lUY
         //vzNvMKppdijJqE2f6V0UBnD7N/X4HDfwHuiR0zHc1I1jP0YF5C062ZQ1b5rJYhAy6/
         8d3LJ2ZGkHUCGaEMjgkd/OOlFptVvlqaZiB7oJ/nR5LNaIEfIiEEV/5HeE4MrNn2tqNM
         Jk8jLLqq0uzCnLypDwtXgPNZNmchg6bXNMG9ynQmO8vCZsfBf/pUtsRgEkrczshmDCWn
         ltfH9e3LAeLEwA+kA3LXnLXu0vpTkM5oJu5kMfBPh1lj72P5xhtLVJJw3ieXt+KASscr
         Fetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763954201; x=1764559001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjyVN0WFpD6zel/1SQcb4kWsuE+t0YVPz778/EfYDIs=;
        b=P6yRc9aYNsV+KdeAwfaGNM9vKj0AiHgIZ7otgT5L3TuabyZmbO6s/dB9wPwtWOVTNp
         3FYwTFR4gsfx1Dp/Z6xKeUmSLfFdofvZsU2iGXBgu9UZ6PoY7aBQw0Z3mccd+RAwKAJz
         LQImZG7htCKKKtSITRmhZJhnSzd4+7Gj9iAdUiomwJvl1+mOtS6F2OoHf2kUsOuVdP6I
         r2GZa7V946j5tvZAMCnFlxe3Ek2GBZHxm9o8mWxa/XCcJWOGTE2k3oLl6gRvqfBjP7aZ
         pq+pi7r0lrc+qAgDYSBKaCBCTprTxlt/zITEAKRK5vNOzvn+sjzNvN68LoDB2Wsf1RRM
         qNhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnMsc18JCWtj5Vxxpsx3OiBz1ARzcMJpbPYiijW83vngh969gJUz6EqB9weL8VLrEP1eDWxxz53jE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRpoiS8vKEKRz/WARRp6RQLJsU703ntPXxhRkPU2G+GeuUsVaS
	b8OMuaLumpiWonz3YLjZS1tbuneW7P85enbh3DfqfNG51ojprN04LWLH
X-Gm-Gg: ASbGncuzMqYQD//OBHb2Z7H2PL9psR+jUm06B5W4dP6HpTlrAC9UrX149J5qmfb01vI
	Bp/KJEG4mtO74bvBJMWvo0PyFhrqAs8m2qr/AfngdQJoaAoG21nZPYtjVnNp5Y4LYMS8dPNQRTW
	LMlbxZpb1SfLfw35n7vRixKda60Kmxd+wroKeTO/CBmUbGO4XmV1edGCUt83AmyXRH4KdSgikQ+
	VNiP34ibYIGrvPklW0oT+UX6Iibficf8NZMqWlyowyQbQXngmFNWwZyaCy44ol4FYgpNKogJjmN
	3kGogIe5ADl5ztBaanuh65QqyPiMbg8paiu4gW48xAcWtOtrzCu1rLFfS2EuSZVY1LYZ8aONLSl
	ecYkcKU/9UJ5coyE4lXFHEjNYbwpoEb75LUbhEt+fcvWroLHRV7/fQQXTj+btLe+N2/2Ffgxxs/
	5KJSTpxZm66Eh12bvsBTzAgrbTompSKIaHa5vLTg==
X-Google-Smtp-Source: AGHT+IH3f1GXI4oxPb14EjMJk3wTjesLmudoALHKP8HE0tZUJLC1DK5Ecy5TU8w5/AMaWa6guMK0Mw==
X-Received: by 2002:a05:690c:3803:b0:788:131:d049 with SMTP id 00721157ae682-78a8ab2f574mr84609987b3.11.1763954200834;
        Sun, 23 Nov 2025 19:16:40 -0800 (PST)
Received: from [192.168.2.226] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a798b2a06sm40448797b3.24.2025.11.23.19.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 19:16:40 -0800 (PST)
Message-ID: <4768c20a-daa4-4eba-8dbb-2c99d304cafb@gmail.com>
Date: Mon, 24 Nov 2025 11:16:32 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs/zh_CN: Add libsas.rst translation
To: Yujie Zhang <yjzhang@leap-io-kernel.com>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
References: <cover.1763886358.git.yjzhang@leap-io-kernel.com>
 <6d5747ee48a66ef49f937b3cf97e7716b45ea35a.1763886358.git.yjzhang@leap-io-kernel.com>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <6d5747ee48a66ef49f937b3cf97e7716b45ea35a.1763886358.git.yjzhang@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/11/23 16:48, Yujie Zhang wrote:
> diff --git a/Documentation/translations/zh_CN/scsi/libsas.rst b/Documentation/translations/zh_CN/scsi/libsas.rst
> new file mode 100644
> index 000000000000..7e1a726a6add
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/scsi/libsas.rst
> @@ -0,0 +1,425 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/scsi/libsas.rst
> +
> +:翻译:
> +
> + 张钰杰 Yujie Zhang<yjzhang@leap-io-kernel.com>
> +
> +:校译:
> +
> +=======
> +SAS 层
> +=======

This heading contains an extra '='. Please review your patch for similar 
formatting issues and fix them.

Thanks
Alex
