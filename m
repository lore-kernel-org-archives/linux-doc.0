Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974192;
	b=mN9a3UvU4goBLstldHNOI3aInqBpUXxWPbmI8iQqyY8XQ98gNloOt3HEPUDoFX72menR
	 XW4rIXOXvL+0U6vFHbk5mONUEc2RzpWBXTfNZhp6paMafxZ34GJHWuIt+S7F4bo3dr395
	 50drFHerpAUFHJ7GuKAInlsuQpxtd0w0wOZu1vVpgoKZy1l9crVR+YaD1wwYBCLp96mj3
	 mN7oMVDB9FY36Bpj1wVt1j4ifbH3X2Qeqtp+CP0vicMWw6WSQdw4Y/7Nvg/avaKxdNI2G
	 GqqcLycC+Y6dGh+t6BNDSb/+VOy5E6eRD4wcyPwQLpHfINeDDnvnm+nwgc0WWSLiUZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=epcB0hTiu30Ay9YCdkZT2sgsaeYosE/fH0Ud9BHE6pY=;
	b=E1ThrVe1EISV7yGchug5zuthpt3jnimCL+ZjUpiY9380r60qbFch8Vj2/oHb8HQJjHxi
	 saTZr78a4uAMcVLVBwWyioML91b+IbZtqUAR6dJRGLBeRY7RVnjBo6y0ZSyKsD0TWdfw8
	 XkjwIV5jcv2lR+kRirAuNkS1YHtLNZNuwoKWntcXZ0+YLWZrEcJStCtwCW6M3gWyZjOok
	 gFK81ge5dUy9NXvc4shNBZo1lGuS/xQJdLZA8O3R5dEQm/3dPRJAVipj5Ky9cih3UY6KO
	 OpVcimlEhO2JtVjt5Pclfg3KZbRzpvNEc3DvBVC4dgH8IC+utjav+8HRpaXaKuLKNaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=evuX6trd;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F9B606A31B
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 00:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8F9B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=evuX6trd
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so967915b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 17:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974191; x=1793578991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=epcB0hTiu30Ay9YCdkZT2sgsaeYosE/fH0Ud9BHE6pY=;
        b=evuX6trdavY+rQ9hdPiLIt32D3hJt9DYx00L6w8OmzUs22ucw02BNil0BHuuMxkhe4
         8fm689/990j230sqwymJwa3YjRqx/kNmw3Li+TMTM+3ABPNfbLRrc9dBJeHRTxQwa9qI
         jwOH7s7dPgf0yLY4zdCzUv5FSlyj/Y2sRTrHkonfcO3whO7vzcEAOoiMbXiXY5cwSHje
         gP8UzQ3lo+8wkTqA7o+fgHEamuHpNnctKrVe8MOGUG9qvYryv1kB0HJR8455C8wTtwNU
         Rodyo+x7mygqkaG4PSajSOABavski4++afbp+dLQT73Bk8EJKP3qegP9DeV8V7swTJLF
         txpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974191; x=1793578991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epcB0hTiu30Ay9YCdkZT2sgsaeYosE/fH0Ud9BHE6pY=;
        b=K6N0nFWREUpbev2sPkyhKILKrHnj+W+ELMFBcArrAnHvvJMcfq+y/Ri8S6WQYA7Xc5
         y3rd22x0nAVqHauwm4CA6wWsEpFMf5gXRJn26eHGcOUVnmcfXK1/BqILEuVxQ2oIyrsV
         RZ3Ah3DfxwejXpIcyzg3uHjuZoVH7QI6xFMfLIOroZcCsF7Ugw1IvlPV+RB+bOCLOef1
         ggDN5g9M4+CUlEnClHVUB4glhs6FtDXbcwDaJ2G7tvvEixhKNVwQhc6f/T3hSKWPWMJ/
         4HPjh9LZLsdXdUSZt8W4fsJAOE4pRy1Po+/OSMEedS59/JNHrAU0lsjx3r0cVcEjuz67
         gA6Q==
X-Forwarded-Encrypted: i=1; AKwUvByRdsGQMASK7jQD2pC+5Q6n+1kfdn4mcateXb1TK/FkPI/7+8JVY5y6onS0wo7RafBJ26j8U5MKv7M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBnW+rzoYIde0AHDFy/RS67yrrd36hRodT/QFJunK2Dasr2Z1H
	5qxk3JqWXCaC7mOvp2dHF+Z7RynnnRRrkSnJ+nImcDzVD9pJnNeWVwk/
X-Gm-Gg: AYBFou0Nl72SD3dLIs9HgfU558+05qgpsc9Dn+Kg5U82W0iHHh/tkZNw9smeqSvfzlK
	xyu6LvL0GfaivGtCxkinyqTQ1SXMmdxRGvyrBZlCM6YC11fMl3vTHioNg/UBXbWJv3f0BbhT3hO
	bPpRVCbEFchRHD6OIO7Y2XNcI3a9XH0cli59dvdvpXoFkpa/d+TGJsmVzXrK7EzcxjCLB683yBG
	1VqcbXBM9zEjeNYtXJxghv4S9V+gTJFfnGQBiAsEQwkyBEkqSP3FQ+tsjihObSBymLqeN0e/3Iv
	fFscBMuNwml7tpurpdgIPX6KAsJMaWNAo02KvEigClLeDa+VLOXNvX2eXNP8zrUoAoyfM2Txs21
	rUqc8g+kmdp/7Sl1reIBxr4W7lRtb5o4/o9Mh0Hqh+frv3fe5m0jlrg29H03ei4cH1qWJi3Z/tn
	B5vacAf/6AFKuzl5TGlCm5Sy3XBQ4zlnHdR4Xl9fwKSg//wRn1SQQO1lYMJXJMQyZpSUZ01BZUA
	24Ot11LMgzMTJ3QK0QudfLFFzko5vf5O6hPzW0n/8X8WIpTxsxGRSTiDV2Y8RB9V6JUPIcoaX0s
	7c+/2AYHJuKf2ow=
X-Received: by 2002:a05:6a00:1889:b0:899:529e:dc9d with SMTP id d2e1a72fcca58-8a36a6c5c9amr2879726b3a.1.1792974191295;
        Sun, 25 Oct 2026 17:23:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d85e22sm783839b3a.8.2026.10.25.17.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:23:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:23:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: lm75: add MAX31875
Message-ID: <4c365f2e-8dd7-42f7-b96d-a57daf23bc53@roeck-us.net>
References: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
 <20261023091550.1494-2-johnerasmusmari.geronimo@analog.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023091550.1494-2-johnerasmusmari.geronimo@analog.com>

On Fri, Oct 23, 2026 at 05:15:48PM +0800, John Erasmus Mari Geronimo wrote:
> Add MAX31875 compatible string to lm75 dt-bindings.
> 
> The MAX31875 cannot reuse an existing lm75-family compatible such as
> adi,adt75: it has a 16-bit configuration register (instead of 8-bit),
> four independently selectable conversion rates (125 ms, 250 ms, 1 s,
> 4 s) and four independently selectable resolutions (8, 9, 10, 12
> bits), and reports its alarm through a different configuration
> register bit. These differences require dedicated handling in the
> lm75 driver, so a distinct compatible string is needed to select it.
> 
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
