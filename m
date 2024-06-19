Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2349678C66
	for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 08:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718784535; cv=none; b=mI+RzZKd1qCzfxV99Y9qHlR8jjOfoeBc5Ldaq49XOWXykG9yhHGabD6T8synGOa8oMXWC245V0lqQP0sK0vmPSg/Mx4NNdCFI2y02W1Mhpkkd/mLWbrXdhV17IxxlxSuoQiNb3NhORTmMjYT4e1hDUr9UzXuhmpbqTiFJNa1dEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718784535; c=relaxed/simple;
	bh=vl9KclTpnM+SdGp+CrCX4wdBrh0WCaT2cjnS1mhbu6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FY2WBPEysR8U6nDPN5APytyqFP15ILwkGOy5ccjlWm46HLJIgjIdWMbvFeY30K2gSHjChHcMIU7ruQjW+Rt1fQlfEcQnn+oSd0tsHU5O+xkxPrInisM5R+radfEspMxyFkH6yTrVDPMj4OY+dbEXYqTjjzwZLw3STY7YWOkrBS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lU0wTnSP; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lU0wTnSP"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cc9b887f1so948747e87.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Jun 2024 01:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718784532; x=1719389332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aCIcbRqN1/jGnE/uXHAlTtP9P6llAMOVezx7CUwbZqQ=;
        b=lU0wTnSPMAvIuSKq90Jl8+OhEO8j++q5qM/w6FDMiudR/GjbHvlIhTAn1RIIEFkfFv
         NuIxvQ+H6j6aowar2gU6DQYkPdkiilBDtt8jmnP3Zj977IReuhaEskXqAp8sx71CpRgH
         EhZJQKvEHHjK/V87UnbS9dxo/4/gmIXPFYSx68DacpM0oTHuooniaqhmOg1slPfcUooG
         Aq5fAbYuwjoLbfpTxf30Kzvq5RNh8Ol3HSQwvFPSQBPYkLkCkFpc6JFQpx3R1Ta5j+xv
         YxhJFG3sWoIVn14V8NOL1rXW7EwebWAmBzHWcnndfOg5YFbmdFfkh7yCF9dNEf4HFnPT
         XfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718784532; x=1719389332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCIcbRqN1/jGnE/uXHAlTtP9P6llAMOVezx7CUwbZqQ=;
        b=aSQ4oIZiC0VFuzCroXVWhffc3ozD5IKmAt8fQOmK6IO3ENkzR1IwwT0VayJOWgI9GI
         nhKP9Movu8USW+zoVKRaEOuYcmZ2TI3A0FI+2QmNRbVJTuDbKsg14HpqUbiZQumAMWPd
         7rib6dYIwuVk7fc12np086LNXF0u3t0CJP/Mxw120SHOqGEje9QBWGuUk64tKJy7K5at
         AgmVJ5OX0VOdtuqgAFqmxm849M8wNm+8L5Iife98bJ6G78XVyhwphSI2CCAXnUL6egy+
         /y8YbT2Ol0WSBqxwDLqiur1v+D3vo26iwTsqtOtt1CnGm3Ysd/m3mtS/G+uxxNi8v0a8
         iKtA==
X-Forwarded-Encrypted: i=1; AJvYcCWMC4pSJANNtMy/N7FrooaHXKcRoasnhYqBCxblh4WCWiOoTtubZoeo71PJTemNzE5VArF6cRiyWtNX+1jOtvjnJb3IvtJDASCe
X-Gm-Message-State: AOJu0Ywyg1T4qwSbnwFdO/horLpkTplAtu65G/TM187Hp3qKPqIy6cct
	Wd0hVvAi3sLKoECAA6FN50njiE27CqlkVyntT1LSSuh761rnCXEBbDVBlpv5anfwz3PlMZeRiJS
	z
X-Google-Smtp-Source: AGHT+IHzpaORTCZz1/7jsEDBtxbwIYMBPRLfAyWcTVqZGOfG4wD12iOFalcqhwT3dzksgJh+y2ozKQ==
X-Received: by 2002:ac2:4578:0:b0:52b:85ba:a278 with SMTP id 2adb3069b0e04-52ccaa62111mr841920e87.31.1718784531869;
        Wed, 19 Jun 2024 01:08:51 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36229be908fsm3478277f8f.38.2024.06.19.01.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 01:08:51 -0700 (PDT)
Date: Wed, 19 Jun 2024 11:08:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: [PATCH 2/2] Documentation: best practices for using Link trailers
Message-ID: <aef741d4-d6e0-41f1-8102-c63a0fc5d7e2@moroto.mountain>
References: <20240618-docs-patch-msgid-link-v1-0-30555f3f5ad4@linuxfoundation.org>
 <20240618-docs-patch-msgid-link-v1-2-30555f3f5ad4@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-docs-patch-msgid-link-v1-2-30555f3f5ad4@linuxfoundation.org>

On Tue, Jun 18, 2024 at 12:42:11PM -0400, Konstantin Ryabitsev wrote:
> Based on multiple conversations, most recently on the ksummit mailing
> list [1], add some best practices for using the Link trailer, such as:
> 
> - how to use markdown-like bracketed numbers in the commit message to
> indicate the corresponding link
> - when to use lore.kernel.org vs patch.msgid.link domains

You should add something to checkpatch to complain about patch.msgid.link
URLs.  Those URLs should only be added by the committers, not the patch
authors.

regards,
dan carpenter

