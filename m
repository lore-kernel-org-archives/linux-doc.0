Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857FF24BBEE
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 04:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786939426; cv=none; b=PFPfNXClRUNKasc9r+LHfwWVNlLyKxdEejPhoUc7dx7jGdppEnOfwcgW0KuFhRI6MuEMoRirGt2Xx5KYU76TQySt3xiWlGgqTGEBjsAYw1DmZ7I4EOX4q0YV8BNfENL4oZVozfdVCUDcUjJjzk6CMhsD2dXhxqT06U9pWwZPi7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786939426; c=relaxed/simple;
	bh=+gWzjDUObb8T8GNGrc3WT5wMpsR/A53me91WisAXjrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFv4W6tR2tX/cQJcXA/lEsrJmkBHc5nEI9Bs0KC223/8fzsfTacH2izJ7YvmnqtfkpHVrxUUh1ADhu9+6JiOhr8GEAWV9w1dDS6YY8btLK5XN1s7xbsP86jXUj/CaCfhUAErDWmo6p/2shjXldfvkDmtvKR8y67WAXnq6ZtG9Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tALYs4gj; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tALYs4gj"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso2716795a12.1
        for <linux-doc@vger.kernel.org>; Sun, 16 Aug 2026 21:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786939425; x=1787544225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WNZ1E4rL+SU/YqoSMpvG/W9/4ld37Pvt6CrdV4W2B6A=;
        b=tALYs4gjQvZjxX/D0sNIn1ojNocXBGbY4bxYASj1aFvlz9Rh/Qi4bxfxBAMN9ZG9t2
         cS/qvW8R91o3I/wCitGsxTyf70o3m/QLL9zXRH7vyidOPQD1bfTYuaVwuDEE0Dsc9+bV
         Wznxeo++/qatUjSqxAxh7cvmJAGKzdqpCxZ10N8qXo9Fo073PSTRnvAKPyFytVYaPloe
         hj0lFmOmjkxZztDQtOxucpPgsW12/n5e3oC+IbfImyHZqzqyTwc+aiVfnso6EmGzMEpq
         d+wFFYz9wwTvAeChOTzDlcWQth6west5IDTc0irPWgBEgj7R9xlUN/bkUH+VUA8U/KC0
         GPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786939425; x=1787544225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WNZ1E4rL+SU/YqoSMpvG/W9/4ld37Pvt6CrdV4W2B6A=;
        b=AdQM9GzkTevJIXKhuI9uvDmsYikUvTwTNjovsIHoUfOCJCf0DHdC7Nrr05HoVB21xg
         Tr3xHrY2XUDdYL+XhxX9ENjIqnn3Wq+fpicFdiw1nZRWqu1HkdSf2KDlqR0NLN1wzBD1
         5kJPQQtMBiUXZf9b4kUVDMniW4Z6P87ZaBFZ5O6lMcRfvg6A9l/jFMgvF0z5fhc9So8S
         ntUVK7hs3pQM2otuJ56KhfFaUFwDEeBFkINJIILx/uWyx/qtVFDYxFghmBeh31HuPfsE
         +Slw5lpA9yYrzIULW5MEO0pLI7R6zK3dBSMCiQFg8CpqV4wH4d1ZIwavtjIlkSNEKuaK
         EdnQ==
X-Forwarded-Encrypted: i=1; AHgh+RpkWrepVJ3wei8hZjjtL3Fklx8RDzAc/yFJMbscFnWRbrfQL2txwvvwcXSrjk1zvDf3xzG1Mr3GARc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9d8YJErLmX+QuXOZPKsCTZ2ViLtlLPC4NyGj5QV30CVf7+bIL
	6LlJN3A7V6P0QUfpu2bameFC3BqjWgGtSbUpcDJz0nO35RTNivd7K4Gc
X-Gm-Gg: AR+sD13YZ1rN0JetvFrIzlUJavgO5L2u8EbaoHSKkRslSmjfLLEevqfmqZcUJ7OxYC+
	cDhzlPJ6EYnp4nRLCWMatCUdVoRl7dP0YHjYDTCsXc/NP1C5P3PBFG/AGNoP9Kxyto923Eyik84
	dQwTivSezjz/sJsXhV9Rtjxa7+ClbNPJL+Ytazw4KFbxeD9sbWrd6HCnSHVwzzrCVoewTg8vN1H
	cbWYhtmR7Z8lo8pRw5CAe9kNudfqdh8zs6AAfIVsZN4vEAXPucrxmOue1YMeuJ4ZJmBiuX51Y56
	KC/vmzL2C7AsbhC6DlE/Mz0kQyWF97crvqhtgiSedWLgGP15+yp+M0FWPwf9Ztrpc1YNnVyXCsA
	/WCkS/YGfcaB9B/a4q1AGnFpWgNyN3JR6mb4IFQZ6WsOEiuJj8lMAxEy5M57q11xcOM90yXvr9D
	cFqLlfgiMTtDQ0ygBErQciHJGQ7aXFIlIudnw05Q4cfMiwdJTUif5yZ+CIkMbN47HiAYw9JA7rw
	FSvY9OFDh5ExeA++hX5pHIBg0kDl35FQE9z295U
X-Received: by 2002:a17:90b:5630:b0:37e:1620:dabc with SMTP id 98e67ed59e1d1-3931f24d641mr23244322a91.0.1786939424631;
        Sun, 16 Aug 2026 21:03:44 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5ab4:90f4:c0f9:b344])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14153064d86sm1615556c88.6.2026.08.16.21.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:03:43 -0700 (PDT)
Date: Sun, 16 Aug 2026 21:03:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, cocci@inria.fr
Subject: Re: [PATCH 02/21] HID: add documentation and Coccinelle script for
 FF registration race
Message-ID: <aoKDE_9t4yYLdmCt@google.com>
References: <20260803-hid-ff-input-configured-v1-0-1dc9bbacd88c@gmail.com>
 <20260803-hid-ff-input-configured-v1-2-1dc9bbacd88c@gmail.com>
 <5e96c91-164f-9ec5-43e4-474189e2a337@inria.fr>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e96c91-164f-9ec5-43e4-474189e2a337@inria.fr>

On Sun, Aug 16, 2026 at 08:52:51PM +0200, Julia Lawall wrote:
> > diff --git a/scripts/coccinelle/hid/ff_race.cocci b/scripts/coccinelle/hid/ff_race.cocci
> > new file mode 100644
> > index 000000000000..479f5d1e3184
> > --- /dev/null
> > +++ b/scripts/coccinelle/hid/ff_race.cocci
> > @@ -0,0 +1,34 @@
> > +/// Detect HID drivers that initialize force-feedback after hid_hw_start()
> > +/// when HID_CONNECT_HIDINPUT is used. This is a lifecycle violation as
> > +/// the input device is already registered.
> > +//
> > +// Confidence: High
> > +// Copyright: (C) 2026 Gemini. GPLv2.
> > +
> > +virtual report
> > +
> > +@r@
> > +identifier probe_fn;
> > +expression hdev, flags;
> > +position p1, p2;
> > +@@
> > +
> > +probe_fn(struct hid_device *hdev, ...) {
> > +  <...
> > +  hid_hw_start@p1(hdev, flags)
> > +  ...
> > +  \(input_ff_create\|input_ff_create_memless\)@p2(...)
> > +  ...>
> > +}
> 
> 
> This seems unnecessarily costly.  The pattern can be just:
> 
> hid_hw_start@p1(hdev, flags)
> ...
> \(input_ff_create\|input_ff_create_memless\)@p2(...)
> 
> Or does it matter that struct hid_device *hdev is the first parameter
> of the enclosing function?
> 

I guess not. I was trying to limit the check to what looks like HID
driver probe function, but that would miss similar issues in helpers
that use different order or set of arguments.

Thanks.

-- 
Dmitry
