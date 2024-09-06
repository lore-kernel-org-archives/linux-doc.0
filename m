Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07AD1D4611
	for <linux-doc@vger.kernel.org>; Fri,  6 Sep 2024 17:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725645020; cv=none; b=pLm6ZH3dHNbPv+hRzT5Tb0uNJOs+WE1PfxRl3Q4d/yAWFXz/EPDyt8rntbEFKdw9vlLBss8mLoqI3KfCukNxpOvs4wAuVlu3dOulc+z5l1FFYSraXhFuMJAv+8/ib8cYpgoe3/3x1k6bqZdaV9Zn00XiMW8dbJpHa9FI3Cm2DIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725645020; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pR4WN90zUOyWynSU46C8SnKRjxwMLPUbDbuhcspBHxcJBFN7YXPEda0A2yYH9iv28J0MJcMcvNDIpUOFEEYWclOxmqKMgirlfkvcQ5Y2w40v1TnhPSFKwni2Mx8KeviVw0p0hoxBR9ejS1uDTXDu0fTC7QjqEUtIAYSVNkrvTfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S9ik7q7/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S9ik7q7/"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42ca580f4c8so135e9.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Sep 2024 10:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725645017; x=1726249817; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=S9ik7q7/k29xUOpJQRD3mc+GL+x/r+ZRglHfWZzWlrqbw9wvYyEa3qbzbhI4x2tddn
         cKifEPDSUS4v05RMEUmTunZTWmf3/zpnBjEY4AR+L0lkCG3gh0ZL7ldCLQKfA1XEr1C7
         d07flH4+TqPVFOINEth9POE+r+B75eoX9b3YUvfyU7NXzmy2NqM5yHCRr772Ph3t+Zpn
         fL0WSKhWTEt9Vyrfec3UHtt84n7UcgaqCr6kORf30glzaM0jiHdNc5WO+R+Dgz3BuTc5
         v6e7X8cE0tpM0zfGoVgVjmHMAJxs/c48JMlCNrgSC9FTdLUOejAL3ocPYWiDITAHerbC
         I7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725645017; x=1726249817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=aX0pmod9/M0gHQ61wwxvLIvRkyr7jQaTySmnG7cyMQrIyEHchjTdjE5+YeoqdhLO+9
         rCaxr3TzerzFaqD+V75JwVNID5FLi1a+SGpnAQRfmEZ8tj1D67+huZ0Fdd5QKajXtST8
         93kb8OLp9s0d05wO3dO3mADDCC3CNTCOwwmMZkebH/t5dONCPB8v3Ii40BLk2Xmv3dZq
         rMAyjOrbsTnTl3D0K1cg4pPHqKbdpdAfRQn4mF7zTNbsVfhC9ymvv5jTkjqpzPzWMSJa
         bZ3WMjvdHdaBOpsFhQxtnd1U8Q8+///8ozbZ02+tiycNwJnKo5a9e2jw/Bme618QFKbq
         MvFA==
X-Forwarded-Encrypted: i=1; AJvYcCVz20jMxxRHBZy1vhzdfKdcc0B24CPTsiOwtf/bCPSCgB8csby8KTrNkixhxXlm0wqB4S4SZ1MCGz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM+6jyiuD/eb19SC9FkGsyh193LSRWlMh8jrrJYiLDblZ12t1S
	h9Ow4fhcAaVIRjcNmjOZleIISU0aGXrKvVzmAO+ZkmAabndmvcRe1id0f5NXmWSi3tprriDUbk+
	k5rXZndnT8Z8JugH9ZAO/uzl7emdnvihsvOg=
X-Gm-Gg: ASbGncu/QWRNAJOPeJazNg2ABxMo2Kv2TsaSMdC7HtpLJanvBqS7/RoXExFNBhXWZK4
	SDPq9re0NCiYh4IuW+PS+E1j7EUPoIrv6hC0L1jhclDMdndnjD3nc9VViGg==
X-Google-Smtp-Source: AGHT+IHOlcv7vqlkgAnGOoFg/Cdu9KrQD+OEz5m6AJTBmUsgUHU751o/ZDkQMZfiOBrlPwGBZScRBDsy3iuUbw5u8dk=
X-Received: by 2002:a05:600c:254:b0:424:a2ae:8d1d with SMTP id
 5b1f17b1804b1-42cacd3ab7cmr25915e9.2.1725645016574; Fri, 06 Sep 2024 10:50:16
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFs7P=jk=wfo0nbHzqd1NrGX3NKpOezD4-u=nAMqzq7mq4Lidg@mail.gmail.com>
 <CAFs7P=jPqv2Zr6Fnw584TKhj5joBRt7X7gMidE4MiK1ABAMiRQ@mail.gmail.com>
In-Reply-To: <CAFs7P=jPqv2Zr6Fnw584TKhj5joBRt7X7gMidE4MiK1ABAMiRQ@mail.gmail.com>
From: Joshua Pius <joshuapius@google.com>
Date: Fri, 6 Sep 2024 13:49:39 -0400
Message-ID: <CAFs7P=jfzE6V4EMdVZ73ShdWLavv41kU_NdK-=CO+Cv8dfGBGw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: Add logitech Audio profile quirk
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"


