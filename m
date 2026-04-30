Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B393737269B
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 18:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777573083; cv=none; b=eJ6ezg6McehGMz8loCKAmNezvTJckJsVi3MGmSEIactyWQsDyPmNIJ5nqCz8/4aJWJexWCrSQEkARFk5tpselayCpTLkSIt2K2ha0ycWY2cASIBMbdz3IEaev+Oy0xPFgS10TTIW3IfdBO3K6C8QldFLoXkMCd5dmucKZHfsZrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777573083; c=relaxed/simple;
	bh=EvDjr7QOEivWg0MJ80G0BfUhnPuWN2VrxZ3OPHfOdng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6VDEQd1e9czPsrWSoj5TDpdM5F0s5XElRxB0IgWktKPaSvrWLp9riDVGP39JcIlFfYvEzip9A6hpfP+hVWldZYvDvvxU3PRtA5QJjJzxAoEYKmd/6Vkgba7ACDbMnQbxzaVNhcEys2VY8kvv0PzhX0sUgimdcT9MIBIeZvuFeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Py1+0xk5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Py1+0xk5"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b7d3ecc10dso10293295ad.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 11:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777573082; x=1778177882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNrseZwM9UnOfbU9abnm0ZEe80KdvydEgw0ah+e0N5g=;
        b=Py1+0xk5ttpH19od0x68cXjHvzFZzrw73bApEB+sQgPXeK2ru3TPxuoS9ZUSxx/Lyi
         gIUUcMFSaFUTBwgvkbGJQ2EL9qrDyfFNUAAEJ/XBJR1oLLG0fPU9l7ULeb7jIRn6BDxP
         4P1nAyfttHi0qmK1cnwqTMBaRg7HEq3wB9gXJ4YAe5JRmJdMxBWyetP4vHdaDQYBtq+K
         K0V+ymbdV5x60Z3QVl4Xzjv+Lcvx7XNXun83F8ESUuyQQ9ClwkoR/r38fO4ABB3hNAf3
         /hvziNvnLqu7z6jwyqPqHxivhcsQPRBk4PEwSrutT5ENGXKnsA+qyyQ2Pnby5oCSMByY
         Cxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777573082; x=1778177882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lNrseZwM9UnOfbU9abnm0ZEe80KdvydEgw0ah+e0N5g=;
        b=Huy86+SExUJAkIvXmVGQ2PVS0PbFe8b1KaDRAFaZl/K/cmeuFwrAwUOonw1X2eiGtg
         nADmlrbqP1rZVoDHTQkAhPbxf4D0vmaN3S/qqZ5X+TzfN6QqIat3UbmBykl6JFMtnVVy
         fGsgPJfKqH5nwB2kIuJrPQMi3rfUmmA0etX5iLjP4PEazqtXYDx+pkO7G8hH9tzFZkts
         zZGEXgy2ilyW4f6P+u1kXm0DupuJg6Jl0cgH2TERE+i3ibpZ8n5on9/lyg3u4lx2VzkU
         H8xnzOYaih2BcArT/JWbBlzo9G8OH0bXYA4Q0xD2dPdWkMWXfGihPD/TePbXJbY3Z/hy
         0wbA==
X-Forwarded-Encrypted: i=1; AFNElJ9YYSHHrleLIKwRIHRxMq1QG0lwa/O333ifp3xWKKw0IsY68iT+sfaVM9JJEe9SOUoQ9d9rborp3rY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7oTW45D7aAaoJJwY7+dwBJF1N+uebSsxMb5iEIZ4iON00JJWz
	QbIGOW0+spHEGOGi918pv8FlIHTRLICXsRpIsZS3HFEJFVzrufCVi6lW
X-Gm-Gg: AeBDiesWkgx4JsndF0CBLBr1/Ubsr4hQUc5Sr5naGFsWqUaHwU1O3Xocbju12qmJuq8
	ptFQ4MSy7nfrHF5s38Y1I4bZJ90REwup16xUMzhO/4S0dXx7uyZnbXzzw1MkODVCAGsqj1ZM6xI
	iwrCb0EXwifqXJbKqJ30ASOK+c6K4oQE1G0G2zARMObcpwCP9VsulzjT/zcUgHbLDvJkwFRQa5E
	uLuXm3ZRd/KS8uwbeCItUktneywdkkghAv5NXu94d5FoQaJ2gK9mfJcAE9tiE0bO6PXrABSSRPx
	GXFhbli073P7GJJlMcr3gPkyZSj3V7LBEq0hzcQwSFwAfWBbVPaOCCo50pdFF1ySGZHRNlyAbDn
	9CisDTDSkJetxCc6kicgS4mA7P3z2LYwIMdsxjVBpNFKYQ25ttMyCZOIPIThjJRgwH1A0n1BGaO
	z2t+SYZ4WYHPIYqm79PkYSDfPA1oEYXyDcFZhEqtwTHTDJ718=
X-Received: by 2002:a17:902:f20d:b0:2b2:81aa:f6c3 with SMTP id d9443c01a7336-2b9a24e293dmr34311575ad.29.1777573081946;
        Thu, 30 Apr 2026 11:18:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caaadf8dsm3114255ad.23.2026.04.30.11.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:18:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 11:18:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Brian Chiang <chiang.brian@inventec.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial: Add LX1308 support
Message-ID: <fb8cbe2d-3ab2-43f0-a51a-3ffeb0d8de2d@roeck-us.net>
References: <20260428-add-support-lx1308-v2-0-90f115954143@inventec.com>
 <20260428-add-support-lx1308-v2-1-90f115954143@inventec.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-add-support-lx1308-v2-1-90f115954143@inventec.com>

On Tue, Apr 28, 2026 at 12:19:28PM +0000, Brian Chiang wrote:
> Add device tree bindings for the Luxshare LX1308, a high-efficiency
> 12V 860W DC/DC power module with PMBus interface.
> 
> Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
