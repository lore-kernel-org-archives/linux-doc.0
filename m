Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BB24AA025
	for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 16:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339618; cv=none; b=QPpuObmNTI0ucqs/Fk2Js4ild2TMX22y5Z1SbOeSC0VFaDuRYNNeeIrFYdSgJIFC+a0qjmLtFowkRnVVJLMr2owt4WXuvnR9NHxJKGDkTTEj4L0gMe/ItmVwM5sZ5sUp7XU7yjWOG9JSRJ7vdx1xWAGoEV90ru+wYzdu0fJNyu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339618; c=relaxed/simple;
	bh=KpS1mvfrzPVq+RJ1AUg0YioB5wJtbGxvYJVW8/sEbLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F88JxpXQ/dVP6rc/GU1Dy5YVwMLkRPiXtzUPQGm7NlkTc70Kiy7qY+ifuK4VqjhLvcIG1K+zK8W4SPqzX4uYLH+/hqh8UvaXOASbLCfyrjYIZ4ukncf8wuIn4j2prvTNz7zyYryfkVh5gJN2bztMD+O5hzdu4UAOf4oK9XoOd8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfJWBeDg; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfJWBeDg"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535a54bed9so1839500eec.1
        for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 09:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792339613; x=1792944413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B3VIzdAotImucJ/CUyeIQ/bHJawLqtZx+sVJj8zJnmQ=;
        b=cfJWBeDgkw3BS0eoZk6Isbg6AtT8CYAIS2CrCwKAEbWZ5JdW8Cb7KhEYeav1bceNk/
         YzNUwS52+sWOT9gwl7IOKQP7OxzvLNYDjxR/lYEXl43b5kB/fM3FjhgbM1piAqWZLqFp
         nwVG8XYY5YozKi221qgBE5EDYvHgzsdng3rUVQZsia2taxh7+MCE1L27U0PHsJcEDTE3
         pf9RICJf7Y4OvFdfFFZRcfowfufOLrJvCmM6Qy2BRjWhWAcBUC+B/ZAw6T9Uv8HgbEMW
         sjhj1FRC7F/ojZMgcaCwkM2wuHYuzdsc3OLEufoXbPPTEhgFidVJj8vKXuMMvaEsc88V
         EtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792339613; x=1792944413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3VIzdAotImucJ/CUyeIQ/bHJawLqtZx+sVJj8zJnmQ=;
        b=jKsDGRTtsp7dswzdoH+NO122Fj8lShUf0f7FI/2HIXwJPlmoe4c5brjYkr5BMS98Wv
         CPC/X7rYz532yCqMB9wGzC4+Q8renUSuBHJ2oci0bcmxmZkxrX1jqVSaJzr6ACLPrNtz
         RZ2sESzxDnEG2afGZj5lkcZaGGB+SiOtn5tNgVoK+PPVI8r8oF2gwvd0rOzAlhNuzugz
         YUprHS5C4ii9oNcbrwZOeT/QF+HIWBVoub3WhxDyUf2eAit4wlRpY8ZRLYzZRLKwuZXU
         cv63LKZq8xo7HPd82xWzKVZiAT6FpSgyjHWVVs4vzZbrJZxoJRxiLRFMWJ+9oeAdR4M8
         dxgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHWuAAJLywkrFNdp49N44hf9N9hJQ+6WKL9H131o8UwyGvyvsnB8IQ9A8zSAy/FM3pZHwGD9sd/qA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnn/pBjULtc+XPi58SXKLSz6IWEOHb44UpLUSQRQI4syANrRQu
	W4dom48Ll2Gjiffclj+uzWgOwfFyEyI0Kh4CoLDkINE75veLejiIU04i
X-Gm-Gg: AYBFou1oEqQ3eXUqWtSkVgBDzshp1WdIg+jWbEZ5NTO/FDWXX84lqdzhMEGPOraky4j
	03v2I6ZoazljXFFhgllrXdjs3PzaXbpLQ4NxgUyWeAv/Tvs58/wtQOOXkk7Opredz6Dwtf8mqqP
	yrDffs5F7eOhSNRzS9MBbgpY+N957C4CFwfBamIsp53CCtFr/dyzM9Al22S5xInVfTIk4i3ndrr
	u/ESD8inw5iT8lFzSoTsDL2fabg84dG++D1NHYM7zHgrQxRdPPHcTDkJcyfnpZ9XGaH5qJhLUok
	XFCPx8jqUZEp0BL5O8tabh4JGZwnsF8a5EbFik2KuHZCs1Ki/D2bYXX0mcvUsMCIKjQ2WJ82JF8
	DzjMv1xnEOcBAYevbFZ0cmRnrLQe+Za5MUTLQHHVhJN7R92sfYtvSgsDQC1LHLQaKmXY68P2eaH
	b5Plk/PIhxpAb2/MVVLIEBImc9LpMgxqqSqnXPhTVntEfgyTjx70LzpN+7iDKMork5ESJMS9NcQ
	z4is1R+Ke2k
X-Received: by 2002:a05:693c:6311:b0:361:308f:55eb with SMTP id 5a478bee46e88-361a264b569mr7771322eec.30.1792339612707;
        Sun, 18 Oct 2026 09:06:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm23948470eec.29.2026.10.18.09.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:06:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 18 Oct 2026 09:06:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jihong Min <hurryman2212@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] docs: hwmon: Document the uhwmon userspace interface
Message-ID: <e77719ee-c813-400e-b49a-9f8a3b0e2e91@roeck-us.net>
References: <cover.1791531025.git.hurryman2212@gmail.com>
 <c02aeee5b7e7a5d159d4df5baabe925e16814e94.1791559095.git.hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c02aeee5b7e7a5d159d4df5baabe925e16814e94.1791559095.git.hurryman2212@gmail.com>

On Sat, Oct 10, 2026 at 12:38:44AM +0900, Jihong Min wrote:
> Document the uhwmon UAPI for developers implementing userspace hwmon
> drivers. Cover device registration, request handling, notifications
> and device lifetime.
> 
> Assisted-by: Codex:gpt-6-astra
> Signed-off-by: Jihong Min <hurryman2212@gmail.com>

I am not going to review, much less apply, this series.
Exposing subsystem internals to userspace is a bad idea and would limit
future improvements of the hardware monitoring subsystem. User space file
systems are bad enough and cause all kinds of trouble. I don't want to have
to deal with the same kind of issues in the hardware monitoring subsystem.

Interested parties should implement kernel hardware monitoring
drivers instead.

Guenter
