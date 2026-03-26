Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55B0396D3C
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 23:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774567152; cv=none; b=uwTMx9lf7xv4hrTKVtxFErbX6b6llMy50AjNhu7dA6UqmddtST7H2R71SsFLG5VKBsSmmRpPOo4ey9vkEL+Q4hdhlIBY1LaJDNU3egdyCXdeZ4jJwAXwTm73Kpt7P9g8JCQZtqfc6V0ZZuafCL7/zIhpe4fBAGAvVPcbzkKWRyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774567152; c=relaxed/simple;
	bh=X0Me/dNUi1Q+mcBQys26ogIjAtPJH3qu7jwMW1opn38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKrY4UHslB8UWfWdYEHSiERuhMl8TIDcNdSt3yof2X1XHvwufHL6DfRk8ppu1KSMfb8+I/WC/aL7FAFvE5PkFO62zZZJJFb1weECpmwBOZDRaNy0u/orSi0IFaSFBLIW9aJ/ETl6fNALxCEL9JSJJWeCutc3bnKE3bDBbOzDB5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJl3p8TI; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJl3p8TI"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12732165d1eso2442446c88.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 16:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774567151; x=1775171951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aND1sIzVOhnEEepy+yl6cKYN4PM5Ggk917eNAz1qw1E=;
        b=tJl3p8TIbHqcxZCrf9HCipNbffEPIeQP7ntZOi0Zm2f7SW/3FCHr3Cv7/PxXCOLTTn
         VfxBsYpyDwRFskIJ69ppQDZNnKArHJF1mfeA3A80kELGJYXrFmGflUNCowx6FMiv+Ckf
         GsPS/mUyIWZWC8QPiB0TEA4K+ybSVzjtiuiJNTKRtY02vtE5oJykisOOu2Agt+pvZ8rI
         Srgmmn2XMOGYyPSvwuXtWJh2Nx0ckr1I44vL5QNWYgrXX0SgvUN528CVsHeiwGkPXw7e
         QcIiIhIubF0h2NOcQ3OjoIAlfKqWu+QLqc6lwi4uzL2Ei5bmzc0Lf3OSEDHu3i8MPCka
         i8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774567151; x=1775171951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aND1sIzVOhnEEepy+yl6cKYN4PM5Ggk917eNAz1qw1E=;
        b=ADGHeEeH59+5zhBN8r8cny00XJJnsDy7AHmoB+28ofrFv+QSpXXXmRv1yB8HvgWx4u
         AXfMBMC7a6PuAB8/8Bb6EB4C4qHImnXyG7tPhYC+gJzWtg6ODSlPUM0FRDi6r7uX5LBa
         XFg03Ggl/98ZARpei50hYrMj5LGviPxXQAwUg1R+QZx7A17sjfhFLps/9TSGtD+IAMwf
         W3hQomRVP+13SdZzI1U8gyr/j0F+SD4H7SW/DebQjKlixgioW06tnBye0nhQqvmMBsac
         lp+wZG3jDF6SH6gTk8yz78i3SsIE4P+AEBRYyE9ZORti403iuIikUodKEUj4EfPXE+Yt
         HqAA==
X-Forwarded-Encrypted: i=1; AJvYcCW+NIYQcgQqzkR0QQSElmAUyiUb+HS5D7usbe5UAwu3b1DtHZjSAEB+yDcFCEplWjMg3+rrBGVSjCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJQleblqLCATPlGCX6R4XzpeVCjcrgoajGUQUEFxw6TdyhmboM
	OiYmd19Xw6iH9K45f7YqvxP+af2EFRTPwhDeldxtHRBhFA8pKCEMLPiB
X-Gm-Gg: ATEYQzwmBCiBmFyi8+FCzQZfUMwbLQjt8dPgQCmZqloS7tltUDiKbbaaTWsNCVXrZki
	FScJhJD9q5fjoVMs+tK1rpdvt/JJfYd0xqsTiceKe56GhrFkYWZlEBcN/q2yYw94LXuvP6ZQNkV
	wxIXwshmEuGvojkuSgn9HfqLxXz/a/cxcB65yNw7J7k7OhzcIG7kMhwvbeyIecZUucKmAfAQxBF
	khCOaX5gl9BW8CQxObz9ozko0ZcTdFJLJBX6HouY/E3Py6hnpO7qap3NjB8Y20HwAgmkLsIZQzP
	6LVaEEQ30vjUIYSuwTST82KmEVCL6yZBCzUgr+9TLJTfxB0PLGX1M8Uwh83NIJSjrY7RtAIMQrG
	wCW1CiU00zEhlgvzwhuGlZ2m8X7B0d0Qk1euJ4tNetu3x9W3qm+W0di6c2abIHyhV8oUz03k944
	AUUw8R9ZQ4Xk0WRQbXwEGBMPMVh2Qd17m+BM6m9/bhjzPl23XiMvsyUGhfg+xWCCU5
X-Received: by 2002:a05:7022:6183:b0:119:e56b:989b with SMTP id a92af1059eb24-12ab283c9fbmr263185c88.2.1774567150716;
        Thu, 26 Mar 2026 16:19:10 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:c497:6d9d:a11e:c553])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa7827e02sm6040198c88.12.2026.03.26.16.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 16:19:10 -0700 (PDT)
Date: Thu, 26 Mar 2026 16:19:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Joe Perches <joe@perches.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andy Whitcroft <apw@canonical.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] checkpatch: allow correctly handle full files on stdin
Message-ID: <acW9KGbNm8bLg-cr@google.com>
References: <acTPXMJfkHLeItrK@google.com>
 <bb47800754aa3279e88c9d88c380bcfe6263fb2d.camel@perches.com>
 <acVIBseRrqJI8Uwb@google.com>
 <117b6a4c164a9f0ce348044152d00ac22b31b81b.camel@perches.com>
 <acWnbG3nGjfYeYXh@google.com>
 <34318752a257b0f6b530eacf53d565de1ac84485.camel@perches.com>
 <acW6Iar6XOzO9IfN@google.com>
 <3217a61e50f7b9fd387b908c0907bd0bf889bebb.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3217a61e50f7b9fd387b908c0907bd0bf889bebb.camel@perches.com>

On Thu, Mar 26, 2026 at 04:10:05PM -0700, Joe Perches wrote:
> On Thu, 2026-03-26 at 16:04 -0700, Dmitry Torokhov wrote:
> > On Thu, Mar 26, 2026 at 03:56:27PM -0700, Joe Perches wrote:
> > > I gave you feedback.  You elided it.
> > Could you please point me to it? All I saw is "just save it"
> 
> Seems constructive to me.

As constructive as "You're holding it wrong". I want to be able to run
checkpatch as I am typing, not at some later time. My editor shows
diagnostics as a virtual text, so it is quite confusing that the error
is still shown even after I fixed the issue.

It looks like I forgot to add akpm to CC, let me add him...

Thanks.

-- 
Dmitry
