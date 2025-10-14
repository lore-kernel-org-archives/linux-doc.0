Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA922C17B2
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 15:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455005; cv=none; b=cHlRT9TQUi+udnsGmzkBP92uKEizrPnBvXK+UMZo3V+/Huuze8WdSNJuy5B/bEsPN9yTp7PRVrNuShuEaH8nE+jivAdF+sZR0r8mY5YsSNLTjL0ciLQAS5/EZpSHVd/tIX8xkVCTwhwNaNpPWi/l5SPiX/46WYVFx72fg7XeV/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455005; c=relaxed/simple;
	bh=jTNDcxqogKVaZtvPP9YOb8ee/Iyh6X79+4lxjhYUQz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJWDJhjoUOLO0Rvc7kwcRMaBUBrOeyCpHiRPvPUWrCqLtVLXrka30rVFjIAtpayoRqHfqEQeE49pNiqXdN9VbQJrOuwNfdxY8pwGKz5hs5L1kB2ki2UarOAlTuhW14hhFg7B49xa4L1ddCkCdBbnPZGNVTOSFbGYekaVx+4vVAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PF4M0m0o; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PF4M0m0o"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-267facf9b58so31377955ad.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 08:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455003; x=1761059803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Aftt5GDndW+QmwWYyCYRVm3iyK5ExICkKwljxAsMHQ=;
        b=PF4M0m0oKH0NTF++WbMmCI08mVlAkrwy17vAlBqnhVZaukdF0Bg34TCX5/QTZnq29d
         3P1WH50SdOV5c7Z7oyS1yiHAC1fnW1vCwCGhlVVPz8GPNiP80RWbmwK0ZhOQ+vUlhcLb
         q1EWAHWRAftTbkmgG8s6zBOLZbF2AsRlKKAlUOp+kL/pXSRGwH9G9AgcrTbUgT2eH/UX
         VLkNayRVkL2KMNEtbPhy8f8UW1HEar7JQLx10G946ovCDT4Fl0lemdxAgSqXJFc1OXkm
         daY7xDbrnO854MYm0GY3HxlsjKsckTYU1MHjitWqCZ4WSS1GIa1JYLx9kbUfHqYG54GR
         r6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455003; x=1761059803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Aftt5GDndW+QmwWYyCYRVm3iyK5ExICkKwljxAsMHQ=;
        b=gsc1edig52rHEqF1gd+HCFtzTnc6KvXfFS5QfCOG7Mz3acr11BxRqw89BTAQLc6dD4
         LLlvxrX13QGw9ACFe9aeUFGlf/AOIG96mR3jNNqX2+IvOMfpw4UyajV7PvlYtbLY//NG
         X/JAIvAm61YTPp6UzORjcFHSiuVjlqDFNKLJ4oafYkYi5YDyp6J+vzEVJpbiCz4GxBYH
         wKrTCt67OJ/VHlFE6ZB6EpnBj6o//RhaFJq8Zjx1kSt8dhGqeygeiX0QDqCAutbVJ/UK
         zVnFN2m+lU6adjL20KqZ6Cokoy6qBMdZKfvyFKQztubbGwkczcFnONuCfCwsCEgLvoIQ
         XaRA==
X-Forwarded-Encrypted: i=1; AJvYcCWrS3aRwYncr+aE9nse4RDqBt+F5vBoHSDqGtdTZqHFvVIh/Yk0aY+lU25yIww2mBR/j5Bg225d604=@vger.kernel.org
X-Gm-Message-State: AOJu0YysXKkMBE+SJ2iFF/rmA6YhnU7AmzeZ+2JDHgLTh86o1PGoNrnJ
	Q880SSPn8ulOXIPKLS3P8z1RSUtWcnamZ0p5He9mR1Ytta0xR7lll0+rWMhs5A==
X-Gm-Gg: ASbGncvPb4q5aWNr86xVFI+4dcaPG88QcLTHxkg83W6hV5k41Ty0S5uw/el+OaginXF
	v3yzz/UAMyC04Y9oc07PKaoaBXspq2+OvIIu46SY0Lny9c5owFt5SN3VSAwneM5buj4h7bKqTSr
	Q1TfCJqVoUC0nWtOVXL7zYhvvaTtyg/I3IVQvjGmCP4JxaceQqoHqKK4ZvcAkX83qYHHX1ImrrI
	Z6aKO8AWK95cL94n9qr6444QOKYhyhD8R9ssf8wnc7DEQFMzeYE4W4Z7bLTnngyC1SyDmwQcwie
	GP95hBd4DFcBn4Fea2F7ciFBS39eow1iPxYr98n3hfPHV0SCnRAVpzDEOzy9/6SfnmIwGBY9RoD
	gnswQNsSfT8jba2p3wdPT6mokCxfQnvViFNwYqenI4BtcJQT+ifSgbY4CjgYulWLILSQzoxVMQf
	U=
X-Google-Smtp-Source: AGHT+IHcO0k1gdRh9Ik7VrSifzpnxsBG8UUPfwEIqiLV67RhkTa/m4Z90iP6pclDPdHI+s5aAf32eQ==
X-Received: by 2002:a17:903:11cf:b0:269:96db:939 with SMTP id d9443c01a7336-2902741f404mr296208995ad.58.1760455002711;
        Tue, 14 Oct 2025 08:16:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f08e2dsm166399205ad.74.2025.10.14.08.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:16:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 14 Oct 2025 08:16:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, cosmo.chou@quantatw.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial-devices: add mps,mp9945
Message-ID: <9ea2885a-0b86-4166-9a24-e7aa7918be23@roeck-us.net>
References: <20251009205458.396368-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009205458.396368-1-chou.cosmo@gmail.com>

On Fri, Oct 10, 2025 at 04:54:57AM +0800, Cosmo Chou wrote:
> Add dt-bindings for MPS mp9945 controller.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>

Applied.

Thanks,
Guenter
