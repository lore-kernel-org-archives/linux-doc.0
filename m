Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D1528726E
	for <linux-doc@vger.kernel.org>; Wed,  5 Nov 2025 21:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762379427; cv=none; b=VU2tvXVWy2Q/tFlzdEz44mmIK+BABsZGeNXpBiPX2w434lENyeNIfqL5sxaiilcekvGv63fmy1pLOivASvSZEKeMDEcpenZnmjITrBziGgcDNp/QtfLspdzrsEAwTe1L5nvRrwwvIbWhizOKGuMGAY3hwSPm3PY4SvdbJ9kwUe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762379427; c=relaxed/simple;
	bh=gZ380I0iSEejLLF800fnaHD9+ZfISv/wsUJeZNhR7Rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkUoosACavXRDteE91wjUmyZ1AvhO11ZXIyGmljDxvnIVDrvneMoSTlD5Xez2qNPvbwGSkNnFGWFy/xQhNUMZofnBZOb+AvvRfEG+5iiwpf+K2pvK/uFJ4L32w+QaY3jN2m8XaFT+ifsSMMqY7AH4QtgqK1WDyGCEmiu1w3Y4OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+vTp1W4; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+vTp1W4"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29516a36affso2916585ad.3
        for <linux-doc@vger.kernel.org>; Wed, 05 Nov 2025 13:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762379425; x=1762984225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GkJz9g+z54wExynUelx6wglM9y0gBWoZJbd4IPl+Sqg=;
        b=F+vTp1W4SoFJpnBf+kqRgFwXPXlt/dZvyg1FDJwgoyuYnMTbx7s5ueeO2aoOqlfFRc
         D4yX863oBEOeAQWV/VCb/YxxXK6Js1rY6V4Lnjc7wWQwlHIZM50e8pLQj1nTjaSyXUDQ
         cGbBBrRTH2AevK+H4nY7/JX+1WIOT1xJRa7XZE0fQv47I8nM/KkEq4Zn/WGWyPeSBaSl
         tAFMbz0FkDnraREtgzcePy1dQ0/ubTu5nKE3mwQr9JasANzWsUdGlM2o111woPRPzjDu
         8Cyb1b+pkr5OrpRuadkEm5G7RjoujnbPHlGprfiX2dM5/13iMtxqL98RhSPwq8YE3epq
         buEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762379425; x=1762984225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkJz9g+z54wExynUelx6wglM9y0gBWoZJbd4IPl+Sqg=;
        b=SR/efakcIsoROCDYhJPOeIXk8ll6k/JyYNt5DYaJXEuK7DEZHtTFMVOzz/OX7c/flK
         TSXLUkibE+zV0EQIXB/BwrV34/dpCYvULvdWSTsempKLsm7NszSLEv2iQLjlxfmQ//hU
         8hwb95Pm1C72Ntj6mnaoy/lE4E64dVOlEhvkoLhIVIA239dRexOwgKEx1jiGwYqBHHF7
         mwcUjRcoWwO/WardDA637YeTC7wVQwalVY33AOUla0unRqqN5UUQCYwjOisHsKze0u3z
         jSI+TIKdMtWkZd5oc7T3/2NWTIn0S/SCJVQnllsfH6ZaPFIbrSK0yFYISB0+sIyKRhsn
         iG8g==
X-Forwarded-Encrypted: i=1; AJvYcCWmLsqVX69WrtCZ1DVa5nlNzpf/HC/2OLJSpXSS53RCoReyutuLlLIpKVK2xXBHOsMw9KyuLluGGD4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi5DeBeRLLGy33bfkoDhkmhaQ/UEornNPOXMapLaG2DanZT+Id
	bYzZ+JRpcB8iDR1vIWMP9xKONg0PkTSPK31qfudbyjOWqXoAZ9cOTVOs
X-Gm-Gg: ASbGncsKkoFDPTAOkFES/9lH/4cNptFxaYBPBuFyOPdvNO1t4ElRc+TX0LwOB5Li6Fd
	33CRPaZYlb4+HnKsMjLPJWa0kEY7v3UEi+Nyq81115gAWD7ZbHl4vqKVCBP/mfAxNJi4fLEwdNb
	ZAwEfVJ2/tyOdGbs+dD+9pfNBGSzs1tOvEq6gQn8ubn8YPgC3ikxIAiFtuhWM3ky2p1GXwI950A
	3Zg0NwxWviGmtYoH/iwisbMPzSlfRxPdh+R4DwZ/M7TrY9Q64VaWwT1nk0GrfDeFAxgrj89rNNo
	EPDqkG3NhkDIOHUjELQrcvv6sriEz5wCo2Js21qKWnX9Ddv2nAryodfqa6CR9dIB31cu5/vNFWV
	d47k/jYpXant6kmMClRoQKuxdWr+sWalStW6GqB6YFnAIH+GX+oQ6jnSbGDxj8i0fk5kZASIHwR
	D7v6Y9Zsr9LvaQ7K3qQvJo1q5MGRv9NYIMI+eQpcg+/A==
X-Google-Smtp-Source: AGHT+IFMkzfsbijd+VCoID/c6AsM0dQ38208M4pgSEwiraeFpdyxx2AcFvyuO/wBvwY6fhwy/w0BQw==
X-Received: by 2002:a17:903:1ce:b0:294:ecba:c7f with SMTP id d9443c01a7336-2962adb9771mr69381825ad.48.1762379425495;
        Wed, 05 Nov 2025 13:50:25 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:35dd:7def:e1d1:adfe])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651045bf0sm5331095ad.48.2025.11.05.13.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:50:25 -0800 (PST)
Date: Wed, 5 Nov 2025 13:50:22 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Peter Hutterer <peter.hutterer@who-t.net>
Cc: Jonathan Denose <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	Sean O'Brien <seobrien@google.com>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] Documentation: input: expand
 INPUT_PROP_HAPTIC_TOUCHPAD to all pressure pads
Message-ID: <7h77umivuixhxkktdcypzthlrm6xll4524e4dy3cb54iljeox6@guwqyvx2e2pg>
References: <20251030011735.GA969565@quokka>
 <20251031041245.GA1316325@quokka>
 <ueksimssfw7eqxa5mfmxruj2ghtuncznhbgdxvoorjf6jhjfhk@hsuapbn3kie3>
 <20251105060333.GA2615904@quokka>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105060333.GA2615904@quokka>

On Wed, Nov 05, 2025 at 04:03:33PM +1000, Peter Hutterer wrote:
> On Tue, Nov 04, 2025 at 09:09:09PM -0800, Dmitry Torokhov wrote:
> > Hi Peter,
> > 
> > On Fri, Oct 31, 2025 at 02:12:45PM +1000, Peter Hutterer wrote:
> > > Definition: "pressure pad" used here as all touchpads that use physical
> > > pressure to convert to click without physical hinges. Also called haptic
> > > touchpads in general parlance, Synaptics calls them ForcePads.
> > > 
> > > Most (all?) pressure pads are currently advertised as
> > > INPUT_PROP_BUTTONPAD. The suggestion to identify them as pressure pads
> > > by defining the resolution on ABS_MT_PRESSURE has been in the docs since
> > > commit 20ccc8dd38a3 ("Documentation: input: define
> > > ABS_PRESSURE/ABS_MT_PRESSURE resolution as grams") but few devices
> > > provide this information.
> > > 
> > > In userspace it's thus impossible to determine whether a device is a
> > > true pressure pad (pressure equals pressure) or a normal clickpad with
> > > (pressure equals finger size).
> > > 
> > > Commit 7075ae4ac9db ("Input: add INPUT_PROP_HAPTIC_TOUCHPAD") introduces
> > > INPUT_PROP_HAPTIC_TOUCHPAD but restricted it to those touchpads that
> > > have support for userspace-controlled effects. Let's expand that
> > > definition to include all haptic touchpads (pressure pads) since those
> > > that do support FF effects can be identified by the presence of the
> > > FF_HAPTIC bit.
> > > 
> > > This means:
> > > - clickpad: INPUT_PROP_BUTTONPAD
> > > - pressurepad: INPUT_PROP_BUTTONPAD + INPUT_PROP_HAPTIC_TOUCHPAD
> > > - pressurepad with haptics:
> > >   INPUT_PROP_BUTTONPAD + INPUT_PROP_HAPTIC_TOUCHPAD + FF_HAPTIC
> > 
> > Should we maybe rename it to INPUT_PROP_PRESSURE_TOUCHPAD? We are within
> > a release of introducing it, so we should be able to rename it without
> > much fallout.
> 
> I'd be happy with a rename too. Want me to send a patch for that or do
> you want to rename it locally during applying?

Please send the updated patch for input.h along with updated
documentation.

Thanks.

-- 
Dmitry
