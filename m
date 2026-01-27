Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D59718E1F
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 00:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769472886; cv=none; b=AEffzuZHV+QNJwM8RAxT4vf0HF2t+A/rPI2mQnD/a3DZxpW4fp2mhTqxVZC+GZKXx+BYQ8VI7+SnGRbaFuD/j/PMwzl/e0j6mDRQbsk4WMkPwVOaDgDjsls8JAoSqi8OI7SzsuZ4Ih3HlUSb8yHthtFSol8uzvEo3zGiWZ2p21M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769472886; c=relaxed/simple;
	bh=TH59QeXuQGouzsx54n3g7177F6nxdq5jEKo8uM4nifw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONacKmQx8//9qjheUS0mAkBQ0uEKP5nTaFWHjzWFwTTeoHV/UwGsRWm0/BrUZn57XlSJKv9tzTqWDg1NC2j+fAr9yJAkN3KmG1ToZ2JU2rlxzjGQER9wdovX29E/bUnM2RZx+VHtaRA4EBtBure/SGOr6OM2qoqPr4T6jiRebm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cx/16uo1; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cx/16uo1"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c5e051a47ddso3160346a12.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Jan 2026 16:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769472884; x=1770077684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bI0cUR40vMu/6PE2qVNNlqy6g+zm/m1EfFecSGRNTY=;
        b=cx/16uo1nOf2B69/VAEkLJnrS8fdFaRgCFt7pRO8hLJTMYv+/PsceIqD0Aicyq76Ph
         8U7IYwlB1Gveh4Z9ZdCZJjPGlVpAM4DWrbNpiS1/ZkbnnwgFvL/dsVGeVmcA5drT69er
         pOt/saXGcXnxpvVe16goy/tV4xAUMyhelZ1x9PZKkszOxgGuaNi/A0IbjFgGikYrLhzM
         AADzEHDMShTPqwlBHE+XrZLP8MkA9WEmxa3K85DQHsjbLfxa6wyWsP9fP/+h1P4KfFbQ
         AMUVMo/MgpV066oYKBYE2AdYmEJ1louhkyjwte0JnpJ36PBV9LI9jiJ0sauRw0kTsfVJ
         V2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769472884; x=1770077684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5bI0cUR40vMu/6PE2qVNNlqy6g+zm/m1EfFecSGRNTY=;
        b=wCFNc2R7b8RbayJMTaNBY4StaCCpB6s2Cu4rJINcotXOg8tpjyPOlU/Du7e34zQ2Kx
         YsweBLG0XKD5aKNM4uUhjAq+EkPz86ZZBPduYGElXOcAeNJypGLm7gFlsjkzTaqlDRVb
         sI1TOzvBHKBoeFXk1oMcF+rEup80BPaEjquKiEFtMhvwnGLFmRGRQSp88iqQd8Bl4JJq
         h37JrnCYPCCdk4Eh6oVccAy1q72RPpanheLXgHOV9XTlYL7fe4bUgJirNHKwmv3XcEsr
         8Gn+IgNLed00dHIf0b7ZKCRdMivGoOF0Lx9tHzqcQPCGZY0xefHJj4wfxk1yn71SP7pi
         GOJA==
X-Forwarded-Encrypted: i=1; AJvYcCUUw1T4pxyAXpiCFLBK+KqHKlK2XE+Iuys1kwJyEA9xV9lYNzKtK3Jt11eb0YU6t0VxAH3d5JbbwE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLBgpg6pu0UUMvwgax/9/LTtDv2XcHBbHbv+UNlE/ZMpPW3MtT
	Qf+uCHzVxVeJG2GVfYgdToI3gkqFtGuU84mNJRHDHgGVvb1pnHFBG43L
X-Gm-Gg: AZuq6aJfvg+9q+GwrVYN8IpxNxYi7Aq2GrnxkSD1ujJtYsD0T3d4h5UGDiAuRezic56
	BhjVHkgyjNb27xaGV2ReaaE30vnmRB9JN04x72rZ3jPFIMSQnj4sR6c0HIR3vP0qGXDfnZqm4FS
	tgj9N1vLmAQ2In7RgX99uWvcthJJ8Pmo9rAZd1B0fG9j5tVDj27LFLW0y0ipHg6zv/k5Pq65oj7
	w5rz8Fc/xUrO60JPqleh34xtksnN4AkiK3uV0EBJcwY9di9nWu0/Mm+kuXWMBcS3Bb7btpibpLk
	iJas8o9joSxZpafBeiilVEdSMAU7HHzg4oYyydfWuAA1N5LIh1Cj3HVux9pQ6ZZ4LjIbSxGNsrd
	qOhds85DqNDn/d/q6fEjBY3BK/yQ0WfNrG6C63x95BmEfVFixaWJFLE+9ZadHjCQsp26SiqwSqq
	w4sQMRL9pCEfnYxVVEDq0P/LhB42iwZ3oQ2ys=
X-Received: by 2002:a17:903:244e:b0:2a0:e5cd:80a1 with SMTP id d9443c01a7336-2a845323729mr67639465ad.41.1769472884595;
        Mon, 26 Jan 2026 16:14:44 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fae223sm98674545ad.77.2026.01.26.16.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 16:14:43 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Jan 2026 16:14:43 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Mayank Mahajan <mayankmahajan.x@nxp.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, priyanka.jain@nxp.com,
	vikash.bansal@nxp.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: hwmon: ti,tmp108: Add P3T1035,P3T2030
Message-ID: <2d56908f-1849-481b-a567-ae7b3d925ff6@roeck-us.net>
References: <20260119040459.2898998-1-mayankmahajan.x@nxp.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119040459.2898998-1-mayankmahajan.x@nxp.com>

On Mon, Jan 19, 2026 at 09:34:57AM +0530, Mayank Mahajan wrote:
> Document the NXP P3T1035 and P3T2030 compatibles in TMP108.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Mayank Mahajan <mayankmahajan.x@nxp.com>

Applied.

Thanks,
Guenter
