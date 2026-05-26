Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F65F3AB274
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 22:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779833836; cv=none; b=PPpQQzDlPUtRyZrnAjC/A1T1W4oV1rdcRUXdBvFyc+ENWvydeTLLcBS4YS6x8pr9qxXnZxOjYHK3vPWKWZGg4QtKJ8zYtVH7i01up+wKoiWtFD05PojaoBDYJ2iHj47kO6LWdvxnzOBs60kmNy9AYVt9sCJI5Q+zfm0eVPgYEi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779833836; c=relaxed/simple;
	bh=JTIgUv2VftcfYd9l6sEUyQNF6pctIiXtnMj3PVjiB24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=abDXJDgj30ZCDHQOEZNtrgyDRMWUuiWjiH1TK4oe0N3jflZEeS8szRZP8u7tDdWikFLoPt2gdQHWic8GqmAWpc4Fp0i4Yrr/xXwfIrNp2THwL8hHfMFO5NYWagKc1ZL0TGvruO1wvnNwvMAcCkELk1GqU+T+iZdVpWUre/vWjw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8goh/EK; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8goh/EK"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c801b30188dso4896984a12.3
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 15:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779833835; x=1780438635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gsD4G5vBE2xNc1zGXu5J2WBwni0ku/DrNlLE2mbcMD8=;
        b=E8goh/EKwHcduU4ekR0BTJMNC4x0IJTuNdoA+n22mjqfz3Oq2no8y4BPI3OtX3/d9Y
         +JKKMBAd5GgRaIiFsk/XlKX2w+w0Bsa4pCfJgaS728DTKlaU2ZM4uErtMd4m34C9NL3b
         WJKcXts2Bmp74RKm/8+XhzN0wmr4pFFSp3ZjjDsut3uNR9mZlxjr8SBN4y48lhCW7FPs
         +tKH9QQCbtusHgzUbYWPC53GQptV/29555JO9CXWIK9A/itBbP2furwXXjUs2CZ5nf+F
         DU/uM1WghowuH6yHtAQ6k9BBbhPPPKKtp37Bu1mIbxso14WWzi7/DGtY7B5t+17jGxxl
         PvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779833835; x=1780438635;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsD4G5vBE2xNc1zGXu5J2WBwni0ku/DrNlLE2mbcMD8=;
        b=ktEEILOOZsZnAW9uX70H3oZYUOf5WC3mPvVQMnGv4xcPJBlxYLLXEtRjjRfq/VTy8L
         aVuxea7//j4SuIxI9PmjNTrmBtwuYK6FXy+wO1Almw4WfMeJxD/lkt8vCkM1i/mIkavo
         yYqXOyPjhOrYKyJvhzuzMJi1T2k7A7GprLyjzw/f0pah02PkZqIcqkpO/uPopLwvRi8V
         Hp0cJ80h/tghzQky82BL/wi1sCIz8GqAt1ctu9l67yVm6eiCJAB/PG2BCIczuPPRG/NW
         DzcltieyoPegh8m1OOTCp4bYTnE90DCmSlVwRJsQ3w8QxQy6wsHh7sRwxZUnm8baWE2S
         c23g==
X-Forwarded-Encrypted: i=1; AFNElJ8LsGbQ5BPJrTwrE5ZUPAT/Z9zF3UzV+R0JRlEy/TrE7Q9f3HeDy+ghUSCZvOOHOYnV5dTMbvIftl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPLRgcxnvKMXk+mDoEYgDF7DcdnjGzevX1yFBm/PBzbxDmfkLy
	6S2FXETbdVDfjPmtT3DYuJSJB8WXd/fofT3C25NkMLx7rNuj6CISX3gI
X-Gm-Gg: Acq92OEixyc0TNYvABkmrUMZv7N/YIHbaq7NBPYNHsEjHiOR8tR+DabDCZh4vFvn+D0
	iXJa2Bwm8KpmY59bbW9CVEuhzcj3kztH2CGrV8iyz04nM8FEtYlXCcvs4bYmgC9sBrbdGQsiEO7
	qduZb8IvX/EyXiox741IBae2NdZ9cGukTsSR9hgdyLCp/VWI3SpX11D2nivqNns/CMefAzImbJb
	9l3QReGaEM6LtU47G09Yg1E8alkmVX06cFj7nJHv5VumQXKuwrIbOE7sGTHYUX9p03IY3W7D24P
	NnxMSf3fN8BcTPkHHEQkurAHdgqKYwur06RyK12KvUybTc3yTL+03EwcqmDlj/IGFnonT8vV6pk
	Az9lxhPqI1hgrYEJ2DxTKWJcyoFoxs0ofhXJtVjL5nlf86Cb0erMcUWJY8cVI3Zly8dJjLYdTxw
	fjH2Qe/C9SgjPrFpoQ
X-Received: by 2002:a05:6a21:a06:b0:39f:1f92:28e with SMTP id adf61e73a8af0-3b32934098amr20456726637.27.1779833834581;
        Tue, 26 May 2026 15:17:14 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4d::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202a789dsm10541738a12.9.2026.05.26.15.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 15:17:14 -0700 (PDT)
Date: Tue, 26 May 2026 15:17:13 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, corbet@lwn.net, 
	vladimir.oltean@nxp.com, willemb@google.com, ecree.xilinx@gmail.com, 
	jesse.brandeburg@intel.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next 04/10] docs: net: update devmem code examples
Message-ID: <ahYbTvIn-DQ4MumJ@devvm7509.cco0.facebook.com>
References: <20260526160151.2793354-1-kuba@kernel.org>
 <20260526160151.2793354-5-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526160151.2793354-5-kuba@kernel.org>

On 05/26, Jakub Kicinski wrote:
> Update the code examples
>  - update the YNL sample with the latest(?) APIs
>  - struct dmabuf_tx_cmsg does not exist, use __u32 directly
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>

(wondering if a better strategy is to add links to ncdevmem code)
