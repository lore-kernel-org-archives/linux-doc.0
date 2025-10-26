Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5F81F418F
	for <linux-doc@vger.kernel.org>; Sun, 26 Oct 2025 12:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761483448; cv=none; b=HMVoXvno0yebRTXAggDx+2V/YUxfaFLkaM+K/2CVz7qE/W65e8TezaibPvtmgVzZWVC7CHmzFOcd75kya3L18l/WM9ta/Ua0OK7oKpJs/WQDzcqeJK4B3DFSH0GA9wG4AQcK+xn+a56UyzeQpU3mRfC+bBakHECYh7tyKu2CrLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761483448; c=relaxed/simple;
	bh=rCGw4ZbsZQCpqBLJPg/c9+/fXOA/cXyXFOwoHEEcBhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6ai0lAvWdgVP6tRoTbJftzaaLaf125Cbl3C992eOhFdcucYJZB2uKMWIAzemq924J+kBbH3ycaBWvvxxec72MkYuDWMUzzbp6wUBZOS3zM/5Dfc7hNcLYc+6lNWh7Pbx49OejrAGkGTOcd8qGTY1ZuqQKcla/S+gtZaIXxLwPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mi1KbTTq; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mi1KbTTq"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b6d4e44c54aso657290166b.2
        for <linux-doc@vger.kernel.org>; Sun, 26 Oct 2025 05:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761483445; x=1762088245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETXrEZX5fQ8Oi3Y5mw2OqmhS1VtxyB2GFpSLLiFAkrE=;
        b=Mi1KbTTqziQFPAvBKPvSJMexoWUA3AYoYm2lymk5rhdVysogyp/NVZsGt+I3tYluho
         xC6NZzKRpdYi14wvMh5zPKaRKve6kRBeQMUJTmAyzHwhBbDchw1dw7uv38gPEFP8kMlP
         t+Ga+0v99K4Po/WlAP2fSEhk2F2UjzHQBEDp+3exA1qdeE6tPOo/RjwRoKKk76DpT5pz
         0NgKHDru0M1OXS5Uc+XXzjxyYbIt0lGNh6K4nG70XcZD87BUX2EA60H9LYonHWwTYAE1
         lgzx7mZyPFzo1MFxpPmrMiK1ui3plDQptMIAUZIfGBMgelN2iC+njNopN7HXKXupaES+
         nJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761483445; x=1762088245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETXrEZX5fQ8Oi3Y5mw2OqmhS1VtxyB2GFpSLLiFAkrE=;
        b=QYmhlaD4qPAaRennk1vPANawT12bbq3zb7bhh1j9rFft69pZvpCzhWAPj6elUD3+rR
         9lGpY/k2Fwz76MlpElh4Dl029yh/BmWtGk/kxuuqX51HGchaObhyESvLoRZGSeaEIPvN
         HJJ8Bu79jqm/OZNnj4AXtxUoffp2u2YwFsJ9y+zw2A4thyOdMT8l0Ds/bIl3bcG9hMnm
         2m5Hm/6P1haiFo/40zZ9/ancGZrM5cf4XMCm+kxViQwpXrVwFkX1FF/gY6KGYyMknrjU
         cjgHwuI1tr1hRy1Kle+QbVJfSJZIOf5QMYCoslcKabXhAZfXzr/87mUH6poLwqGsDIqW
         qj3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU02BOp3gku8Qq8lwsRSmdX9II0t0WV7ZyABOJ6aO7CPYtkwCPqYLhutY2rQiAIA+Gj0vckR3ypgWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZcw/2b5AZd6G56+K0rqu/Z3quGM97+4G8KLAi8Tu6dedAaUl5
	fFDQkowwohrPjBumH8m9JnwghT6DC0C6MHd69lMF0iz2HUtYErK0x0EG
X-Gm-Gg: ASbGnctFfXwjiu/TGjZrdRsFMfcBfNXSdR8V2wduUvXo47mx8Z8CUuTXcyqvS1YATyn
	IGJ0s2uBGt4tKraeLATqpoXZ4q88z0GMuAVKS8tlLuWXs3uJ6A3l6f6lCAlVJGvy9MUj4iZAtoo
	AOxq7kaEnD6yixBBvgykeQiiZnakoUxjwAfZu5ZpE1NDS40cWOENfkf6Y6PXIyfksM7aqcrLaqg
	p+4fVg3o+LGj+QTm5mKgT0OqzKOwxJv/thyOW1I4FcoYiY3gBjLKUPVM0FhpRAzKvosVSiqx5RL
	zaeWK78JbECGh7yBZP3+UlPzbP8DmgUFPIcApgoklLtuMoc26EVRBdRlAuW0DeujVUC3MKqQFHx
	kOkV1sNasySo6KB0SKj2PITr2gePXFHsM9VexRtWB4ju1i3H20r4PyOJhUJi/qF4NwkLWitDGDY
	NCMnWV30nHxF5+j0eXg1HUmzNK1P+ZfKs+Gn8VrYs1h/Ly
X-Google-Smtp-Source: AGHT+IGVz/VPRAxaoxwbFjYCLhD1ar+3bJt34o/sZ1Velhqhsmkm8EcDtkmYcSESmb5WVANXKCHAUQ==
X-Received: by 2002:a17:907:3d87:b0:b3f:b7ca:26c5 with SMTP id a640c23a62f3a-b647570a3d9mr3880397366b.59.1761483444461;
        Sun, 26 Oct 2025 05:57:24 -0700 (PDT)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8541fb2esm453815766b.59.2025.10.26.05.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 05:57:22 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 51C38BE2EE7; Sun, 26 Oct 2025 13:56:58 +0100 (CET)
Date: Sun, 26 Oct 2025 13:56:58 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Andreas Radke <andreas.radke@mailbox.org>
Cc: stable <stable@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>, Zhixu Liu <zhixu.liu@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Please backport commit 00d95fcc4dee ("docs: kdoc: handle the
 obsolescensce of docutils.ErrorString()") to v6.17.y
Message-ID: <aP4amn4YQDnzBBCU@eldamar.lan>
References: <aPUCTJx5uepKVuM9@eldamar.lan>
 <DDS2XJZB0ECJ.N4LNABSIJHAJ@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDS2XJZB0ECJ.N4LNABSIJHAJ@mailbox.org>

Hi,

On Sun, Oct 26, 2025 at 08:36:00AM +0100, Andreas Radke wrote:
> For kernel 6.12 there's just one more place required to add the fix:
> 
> --- a/Documentation/sphinx/kernel_abi.py        2025-10-23 16:20:48.000000000 +0200
> +++ b/Documentation/sphinx/kernel_abi.py.new    2025-10-26 08:08:33.168985951 +0100
> @@ -42,9 +42,11 @@
>  from docutils import nodes, statemachine
>  from docutils.statemachine import ViewList
>  from docutils.parsers.rst import directives, Directive
> -from docutils.utils.error_reporting import ErrorString
>  from sphinx.util.docutils import switch_source_input
> 
> +def ErrorString(exc):  # Shamelessly stolen from docutils
> +    return f'{exc.__class__.__name}: {exc}'
> +
>  __version__  = '1.0'
> 
>  def setup(app):

Yes this is why I asked Jonathan, how to handle backports to older
series, if it is wanted to pick specifically as well faccc0ec64e1
("docs: sphinx/kernel_abi: adjust coding style") or a partial backport
of it, or do a 6.12.y backport of 00d95fcc4dee with additional
changes (like you pointed out).

I'm just not sure what is preferred here. 

Regards,
Salvatore
