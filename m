Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF24318B9C
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 15:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253791; cv=none; b=ZlZcWXMOB9xl0WdgVyse5qp9VdZJZG3ryB5uBzDnq9QggYxdX9r3F9Qui0mhLB0Fly9HdXVcwmpXJYgbS6JmmCx+jBgFpN6WErX9ZjREXnQSN/0ngEFa5EHvw38DDBo/t2Lrg/85rolf/60u3AunF3jKKrTrGVpcp14ffRBRp9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253791; c=relaxed/simple;
	bh=q7Rfr7pvU9flOt5BGgdXDRJFODGjd4bb2GYbv7igOyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pz1u/H+Sqn+aFzOelyrlHJ35Xv6vfdsM2ME2zggmfAH2mDZHwfa/E5QscEhAHh0jrSr8AX9SiHU3p4t42qJDiwU4VSx/BsTZJ+rfdezTIOn0sWND6wRryV68o09EJ1zRvgPAfjGRn0avvt5Kli50952T8WpcA1rwqlLD2rlf38E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAYMDNQ1; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAYMDNQ1"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-848595b338cso4490025b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 08:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785253789; x=1785858589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=id+yadgVtBxUrNMRa6lh7wn0tZuVNwAko2sybBFUr4E=;
        b=kAYMDNQ1PLt7iJQ82vBQr68MsQQgeOkOxAYf5QYrc6imE2h+Pxw5yBbLqM1Bp1EGuS
         adB2ROIUlRIgIawR7SxVh038SrJdL7I7HFQcpQnAiZdydcdOmj2B+Wkol45r7x+HFHxP
         WgYo3hLMUYch9uXOu6eXAKc5vFrWCjoBPkWhbAAJXOJPNe5LgD6sKG4Jr0OM9jHtAc4E
         es305Lm8crAMD5zcmwSuSPsI8qUIsMgFCHhvnvdlNxDjG86BLo5wMVIKbXFjyMn/iwfH
         9W757fllDLUTDpq/fwrQOL6s09GfxNHCILcqpAKQd61iayswu0iRQxrdpCEqD34DvZDu
         D72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253789; x=1785858589;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=id+yadgVtBxUrNMRa6lh7wn0tZuVNwAko2sybBFUr4E=;
        b=VzaVws6RwbAdYcJx9b5sySd4/xetq10jelgjSZ+rDz4YGiLurm9x9D1RjwC5UHjfvM
         VUhPc8OrvpLYH5xiyM/HZY90inMDPwKT42J0W9oeDwP8XwqDuUPlIkjDHPQI+ZGr73bC
         IZNfnN2w1VhjW9IgkNVieRgXQg5NB0LzzaI9C3hM6BMYLFtd5ymCv3Y8vUyvS++qwTUm
         5C8t0YijO/SdjAFyP/6r4G6XO1MRRa/cgn2vVaonO6o5APBoZZ664fv89p9NSKf7BqpG
         zRK9YRMv4R8O+2vbyUXEzv8OY2vwvlbkRtht3/d0nun1phda+MVblR47RJJvxs0CU3Vs
         Ujpg==
X-Forwarded-Encrypted: i=1; AHgh+RoN7OCAMg+rzupRYObxz4Wl6JRL61lNYA/P5iP+SCEOwzpQ94MzWZNS6QsylWnSeiOnNiUEo8lHTGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSjbdBq3B5HKFPS3Aed7MKrFVQ6ne8dYorOtktzRq123U7uVpv
	Hpg1bAx3Mz6mAuucIRgDmRX4MARougtjPLsEX/ZRnjcGSOLZv6CPmgLP
X-Gm-Gg: AR+sD12JRPiVkym3b1WQvl5ZC+0OpE2cK5oYEXBjd2hdz24/j7ZuX3ylcA/AFjSx6fz
	Op3PIkbQ94BZoXYoq5CzJ3fTKwjhxyIZ3IAKhxtGp/9TTVuK6/GSY7GlkhQu6kxQox/GdTScgyZ
	xdsoVKLMyf4STk2BtNikjAfdUymznOVWNQN7+MCfDOZfG2bKIj6eDpVMAMGJJE66QJrEzzIgCx1
	fEW4hvY9d9HHpBrPRihyZ0hTBItMiCOUrVsTQVSGgitJGjBM0/6yCqowGzvZU8V8lrp73ng8X8U
	SaHw/TSKx+7uKW3BMOpNveRJ2NYBoO4u+V+t54marJCapR4z5J5b43O86CnF6GhbHTU5+P62NEE
	+pAkFInVVZ9LERjAluuPP8poGU5/YXljWEiEaLFEFTMT9OPxKai/rBb/w4AUCBpFckNkslIO81N
	C5H/jG
X-Received: by 2002:a05:6a00:3e1d:b0:84e:538:476c with SMTP id d2e1a72fcca58-84e933915f6mr3207643b3a.67.1785253789231;
        Tue, 28 Jul 2026 08:49:49 -0700 (PDT)
Received: from localhost ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe20e35sm142647b3a.1.2026.07.28.08.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:49:48 -0700 (PDT)
Date: Tue, 28 Jul 2026 21:19:47 +0530
From: shaikh kamaluddin <shaikhkamal2012@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: hwmon: fix spelling error
Message-ID: <amjPm6kTV0KcWNXv@acer-nitro-anv15-41>
References: <20260726065835.21012-1-shaikhkamal2012@gmail.com>
 <b263e111-4664-4b37-8e75-3da025fe6c6b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b263e111-4664-4b37-8e75-3da025fe6c6b@roeck-us.net>

On Mon, Jul 27, 2026 at 07:37:30AM -0700, Guenter Roeck wrote:
> On Sun, Jul 26, 2026 at 12:28:35PM +0530, shaikh.kamal wrote:
> > Fix spelling error reported by codespell:
> > 
> >   supprts -> supports (sg2042-mcu.rst)
> > 
> > No functional change.
> > 
> > Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
> 
> In future patches, please mention the affected driver in the subject line.
I will take care this in future patches, 
Thanks !
> 
> Applied.
> 
> Thanks,
> Guenter
> 
> > ---
> >  Documentation/hwmon/sg2042-mcu.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/hwmon/sg2042-mcu.rst b/Documentation/hwmon/sg2042-mcu.rst
> > index 077e79841d2e..431ed832d083 100644
> > --- a/Documentation/hwmon/sg2042-mcu.rst
> > +++ b/Documentation/hwmon/sg2042-mcu.rst
> > @@ -18,7 +18,7 @@ Authors:
> >  Description
> >  -----------
> >  
> > -This driver supprts hardware monitoring for onboard MCU with
> > +This driver supports hardware monitoring for onboard MCU with
> >  i2c interface.
> >  
> >  Usage Notes
