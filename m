Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B82268684
	for <linux-doc@vger.kernel.org>; Wed,  9 Apr 2025 16:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744215717; cv=none; b=BPsbCqfrVv7BxUnL6Ooa961vlHXmU36hz9sAtmvWLQGIInFDyPNoJ1K2Z9jVOqvxZ5wdKp6Bc7wQ5giJgx+ENMBKuHD097ILeSKzWNJs9GWBx8z83mnOcyaUko53wDlZ/1O6Vkp8ZWo4Pv/bLllkjalExkFdN+5vdpzrOChwq6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744215717; c=relaxed/simple;
	bh=u/h+3d8EjVag6zWmPx49ib4ceZQY/YcJe0bN9ApfCoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CWYoFw0rZiG/29fmGjIzrIwKmTpVl8JMmu9TpX9cnqk1ituwlSncfJ79WklYajKlw+69SboAgMCWE6BP58K+iL1/3kOLgCKfOaUsiOw/mdr8nQ2mGYb2GsdqKKzxwIW8dVchiQ6u5tjYOaHbARZtSJYe5CHScWiqVhCAIS7zYH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jp-hosting.net; spf=pass smtp.mailfrom=jp-hosting.net; dkim=pass (2048-bit key) header.d=jp-hosting.net header.i=@jp-hosting.net header.b=RR9qr1jN; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jp-hosting.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jp-hosting.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jp-hosting.net header.i=@jp-hosting.net header.b="RR9qr1jN"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac289147833so1167260366b.2
        for <linux-doc@vger.kernel.org>; Wed, 09 Apr 2025 09:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jp-hosting.net; s=google; t=1744215711; x=1744820511; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u/h+3d8EjVag6zWmPx49ib4ceZQY/YcJe0bN9ApfCoo=;
        b=RR9qr1jNnjpvpA2c85PDpr1XWxVBltF44nbrmy1pi8t/sH3hOVNvZHJSY2lCYw6BKh
         KHJ/s/Io5lxjGD/cm8TeiM/dYKTltS5UE7ok2dioffSHOnJtPAFN6lP4QpNNsd/nHJNB
         VVVS4dmzVfrSShNXZ+6OxSwyuE3Hy2SjoTgDhjuXTgeS7dEVx2HQc38mDz7Y3tB381Qb
         6LbBvDwP0jKlKQ02VWdE+qw01Zsr8Q0uRKNPzAzO7NrZTPPzbaG4/jGUMKW94N4FA73d
         YfBO1HLfG2lopi8ESk4RuXvRse9wXZmwsEG5zvU84l4f7nwPvoS+GpIRbtRcyXnnSlNh
         7cVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744215711; x=1744820511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/h+3d8EjVag6zWmPx49ib4ceZQY/YcJe0bN9ApfCoo=;
        b=D2bkP4Zdn3zdGMuNNq4g4vk/y9XjMz1UMh2XlZa2edS9rbGt4drBJ+n+oo2da53hjM
         0hkf+w86S7WTktJs+Bmo8l2w1d+dZeMxTIc+j6xJfKxpbJKuimQBxwCoGPIsuBIcGc1N
         qpd40FT+PQ6ypnszXzg8LBiq4xzRlFn/7gP/rBciu2OKsU4RHW5iOZwXTNlWbFTn0y32
         dz+/0AD66DnJWQ7vizt24EZIvX3VzuY1LDP+gBby3LbQhiL2s0siiOGaqAyk8pClRNxC
         hQqOpy/qNkyUj2P8yJfH0tFnOqUtd0SP7pT6vqbsAFaKeYqua/nME+qraCNf85sfYsZV
         TwlA==
X-Forwarded-Encrypted: i=1; AJvYcCXmFeA3MJ1WI6gXEL0L3ls4/bDyzq0sXvP2ofvcvliFJA5tNYP0hC8rKmWWyhbJ9j8O+282VjQTadE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVBmu3RsFAbL5IAYyDHLbY7ntG0ZWopDFko+Nb1pOGvLBAfj8l
	jDrEiBiWtDgttTAHH/P6WMxY7n2OxEzsxUXYUdq5N2Y6xRALlwlNWHH2p32HzpXOUMX7eJVIpkj
	BIxkkONy1TymTVFnwx1HD292bLo3Nw1KTQvqe
X-Gm-Gg: ASbGnctgsBMC46PLiX/0jucJdExc/gMCvbJYyKBeH0uE9+GexNPcApgZrYcRRvsZwdc
	GqUcMZxrg5/3+oOonoT8PUIHNQ74DWTJrgIUvDccq9UqCF0VvZ522q/YEo6PHMOT4I4tNUm6QAr
	r85BHByvv0F9yp41l7CG3xYA==
X-Google-Smtp-Source: AGHT+IGATfvK2HiPJufSyA3k36sqNCtM1EiNbUHPKkiU7/9PsM+uBqueyInvxudLSMxdMcEWwUtPliG9OF6KRFXp+Rk=
X-Received: by 2002:a17:907:7283:b0:ac7:391a:e157 with SMTP id
 a640c23a62f3a-aca9d72ec58mr349257566b.58.1744215710840; Wed, 09 Apr 2025
 09:21:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407195120.331103-1-jvanderwaa@redhat.com>
 <20250407195120.331103-2-jvanderwaa@redhat.com> <Z_Ru84ecc13jE9ZZ@archie.me>
In-Reply-To: <Z_Ru84ecc13jE9ZZ@archie.me>
From: James Addison <jay@jp-hosting.net>
Date: Wed, 9 Apr 2025 16:21:39 +0000
X-Gm-Features: ATxdqUHJqbg4aoPhjm2o1dfGtsN33-Jb_7IhXd3_LTqTlyVWT6g0YPP44SM2eFw
Message-ID: <CALDQ5Nwa+-xv9KGbRPHL7z8omw16ZyHcXngdHzGv9e7Tn9QhJA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] docs: Disambiguate a pair of rST labels
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Jelle van der Waa <jvanderw@redhat.com>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Apr 2025 at 00:34, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> LGTM, thanks!
>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thank you, Bagas - and thank you too, Jelle, for forwarding the patch for me.
