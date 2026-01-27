Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D731117B506
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 00:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769473076; cv=none; b=EpOqPTmwv30d95s/1mN+365l+lHj9v6xvxmUiYLkeKzpjYLCEi840YfR8/MKM/INrN2iVgbOxtYPozS5vEvOMHe70vLq2b8Q+8t06HyOKAp7cu24JCrZ2fFg/aaUdqdwWVhuxcLPvu3yccv4lkkthIB9TFLb8dkbn7vBjbpEprg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769473076; c=relaxed/simple;
	bh=RpVEtzoVrzSawk7+qHPvsjMhb1DCqqxD9C0qnee1oJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfFFpsJNNxenOnnR2KLmL3l/4yY0IowKxCGrUNIRUFWghsF4clee1qpCjV+OmzlAxIDFYbobB7M2IIxKoOf3E49W9482xFkpuyBrBX5LSj1LqMZhmK8mHNFDUHg59PRWqJjG8JorThBQoJLo3CgCTzZAp0CD7Izo6lm3XdmsQoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJBPEysx; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJBPEysx"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a75a4a140eso25085595ad.3
        for <linux-doc@vger.kernel.org>; Mon, 26 Jan 2026 16:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769473074; x=1770077874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10gNOulRcwGjDJQj45p9YveIo1l7CK5uNMBsUSp82RY=;
        b=OJBPEysxXz5Az/iugbgZEx/dgdKV3ojczzZfZ7POSj9Ni41/0mZPA+SuSH6Qo3iwnZ
         w7tESud5J8hqvQrIbG4o6hX7wBOcVgCzHxBPIqppfdu8DJRquhpMRxy8OB/4rlALAOQb
         1cO4/4Jvpz8qdZnkXaOb3rFG2Cvps64yF1RctsJCgti6lQi16Lb4JFhc6LRx3zoMRsQg
         B+CEH4lODjyH+/OV8d4LCqq4XcWuITRXFFrJh+K11mJHHkkWus4O7D3bCzXaGEeVenLh
         iIr0fP2eoCAHueGI37bBhujazTC7F/zEEhTfVHeUUcn/YSl7U3WNSLP/yaFrKUCGwkUK
         J/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769473074; x=1770077874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=10gNOulRcwGjDJQj45p9YveIo1l7CK5uNMBsUSp82RY=;
        b=bDh0TASVizDX6BmB8dfsiSnDQslZUjFsTHazx1wFPL6dsG4/rOZBM80sdkv1z9UrIa
         tKSHGsP+HCKQS8pDxQL52ruerXRNHSd+xCap5hkBCJjgaHV2vN08h9mK0YXFfFprnYJg
         LJATEEHJfvTeALK0hSn8BTj5+3S/jk8kFr/pCjXc5PaWDTaOWO1x6Y1MEz/3QIh2qfmH
         lca3lawGUR9eMKlUignHB86wjjLbuPDsJ0rNEobZ87kOYz5OFOhZ6lPVeftKucbPVmdn
         zdZNKCvqPj9rTxJMLIZXsAm3TZap8ELgiLM88KgvXLYhhAO7guXjLYO0Rl5q55JsuM4X
         X6Eg==
X-Forwarded-Encrypted: i=1; AJvYcCV0OHZYa1izAGVcENSh2M/bBQx7VohSoLTlqtKlyxfaoOF5i5aCZVnkhe44OOJ/n05NhBz9E0pREXk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym+/9vBOX97hxtDp/A2aJjZ46+/n4InJ6N+6Nd4CwohbFNZ167
	zCypoJaA2YxX6EWcMXth0jzpm4FmYo/Fq+qr3FQu6qz1gRcGZGGkK/khlSenMXL7
X-Gm-Gg: AZuq6aI/lcac7K+BTcmwqCsiofWBD8TEYmHdZB3nUp+EnNxNPU5AgcTXMAfbtOwKGJS
	BVf1oxG3jr2TwvmjKqd5Hxv7QmfdeUGsgKsurCcAHHh8mWhIxxk4moG4TYSXU2wLYHXdRgFQJ2J
	4T/5B4HBRd++Bswcg0pUi/fqLjy/TjuEPjhKT9XZYBTzjVowWgWgfMXD2134s/Nm1+Rq3um1yV+
	Ge+xoVBlSZiyh593KV77FKqM5r7VdmxvIhLqPPnhl8M+5MVyRT+xnVfCvMntST3AamUcn96x2Kj
	3ZMjum86dA+Jqqbh2KHRxwsBC6DypM6Xjhcxv058qeMWLpWFyumGyYnVzWPJA943Lxn/VdkiwoI
	z/bfg+sgkfBQenxR24RlbDvt4o7cJ0nY76PQkKOWX/dxlX/MYxk64eOQtYMKKuC9X7AB0TP6pOO
	CSLM02q3J55FX7u4KIzpvedK51
X-Received: by 2002:a17:903:19ec:b0:2a0:d5b0:dd80 with SMTP id d9443c01a7336-2a8452f3833mr59109575ad.54.1769473074110;
        Mon, 26 Jan 2026 16:17:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa79dsm96600305ad.3.2026.01.26.16.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 16:17:53 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Jan 2026 16:17:52 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Mayank Mahajan <mayankmahajan.x@nxp.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, priyanka.jain@nxp.com,
	vikash.bansal@nxp.com
Subject: Re: [PATCH v5 3/3] hwmon: (tmp108) Add P3T1035 and P3T2030 support
Message-ID: <1571386b-8b67-492b-9ebb-4aef08885fe6@roeck-us.net>
References: <20260119040459.2898998-1-mayankmahajan.x@nxp.com>
 <20260119040459.2898998-3-mayankmahajan.x@nxp.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119040459.2898998-3-mayankmahajan.x@nxp.com>

On Mon, Jan 19, 2026 at 09:34:59AM +0530, Mayank Mahajan wrote:
> Update the hwmon driver documentation for sensors: P3T1035 and P3T2030.
> 
> Signed-off-by: Mayank Mahajan <mayankmahajan.x@nxp.com>

Applied.

Thanks,
Guenter
