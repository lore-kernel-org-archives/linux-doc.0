Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58083D45C3
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 08:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166637; cv=pass; b=Rb0GauKiHCRNcYQJ3hDzcoBiV4YGdIO4uaMAXD6BjD4F7gQZto4GCmXjAo6kbvpP15FH1FCm1OS0LMcBWVmbVEk6KJKPBeNnN5I5lLpYxLu1SMy8YrKAlQ6zHBI0WIDJ7AuoMEASZj4xDFJFik6xiASzgcKnIooe8uDanS0LABQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166637; c=relaxed/simple;
	bh=jzatqn9CD0GTpHr8meHYFhhCba0r1a0r6tq54url14M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rE/Sgf1jRbU36gSJNLQUGgA+jzfCs0OB1BSqC4ArnAQv+rPkhYUm+xL2z5DY2Ptkjvih4i1qtcdp154qk45OLFZVVPYFO+8Lp5QEUoIWnXE/sUR9vKtHWahYtZGGHF9YvaFbJ2yXDyGMnDR8BsK7uarpAqDtz9oO5aG6K3Y9qNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=W1D3FK60; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="W1D3FK60"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39da69c5ba3so18848771fa.1
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 01:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788166634; cv=none;
        d=google.com; s=arc-20260327;
        b=rSpzMJobwJXvlrpR2BRSAhFU6LSth4ZIEOFjndUxJ0+jh9OBg5xBTZFyQwT4IoUmfq
         YsNxKdr3initskoI5YAnGf87zm0KY+ciDIoOf9t/ktmlpBHHBWjTBJ2Ytkkm8qWARFRi
         MHs4tXh1NiT/5hzLp2vEqprnVaGEANiP+QwbsP1DErAlVhlKEZG1d2dHE/UJX7nPtnmI
         gDr9tv8OCb12/whSbv+KE9eR8i1Zef5Hik758/UvewTLCt36yrAQGeebR1XruWLWPMvR
         AmnSFoZ7HELwzBbevuSO0/P5gb/E5EoQBuiIUafnHkuV9+dvArUHFAbVS8RJs4eLchXz
         kcAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VAWtUADdu6jV6foFPi+AFBda3A8CxphweXBXCBefQmk=;
        fh=VNFgyAIcCJ13jtAIp6BkLXnwOIZruHqYrs6Ek6/y+88=;
        b=l8Pl7Tbxp+A40HGTn/dEWR86Yj8Vd+MVXFRRp/WBpYvfqVBQgTsXGkRRelA/cdyNC/
         LQyV2I7FvXkXVNr8l0+1ph3m2HTm5DBduLj0S0Fr4T919yBl5eexnI8P79fL9e0ss5JQ
         sMR7I8iY4aoJzZK6C2lpB1OlTd68vUN5gNdvAQWMOWZ01BtEJv8XLHt5x9QNHCmb+tP0
         wxGxfkCk9JpguuxUdCONq30A2JnFQ72VWjmRWgY2FZScdZ7pWdjx/OIoleu2jFxZRUZA
         nAdTsTjUProcpzUe/I90/hYtCli1TQFXL264w7Tgpj/U2laqZav7ESOTzQ3n22NSpR5O
         4msA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788166634; x=1788771434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VAWtUADdu6jV6foFPi+AFBda3A8CxphweXBXCBefQmk=;
        b=W1D3FK60o+8srrN8n49rQyxI1X6eGtq0mQZVQYw9uJJdmKjraNeO1tApeG6+4JjTBy
         Ip6LBQ3o1gW5hYe4V2nxNlCqEdkprpVoa1VJ76JCaMTWZx9cGmfxfkA1o1aV5siuMAiD
         vtGa0GHfvzWNv9xP39D6BiKOFXyIdy1oWG42iM5GbL/VVdl2nnIi2MSC/uifMwYVflaq
         pDZNo6LlNOkg/Fdzqr+7isEdvaUGYRNeOci/9FUbyKRRKXCZIFTVGv5HeH4y+ojhHawo
         UDW+9l0rARTw8XGm0oF0ZtZqj0iOPSYoS50Ejk3wQzvnr59VZzZnvtMV5y1dBuFh/VEH
         PsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166634; x=1788771434;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VAWtUADdu6jV6foFPi+AFBda3A8CxphweXBXCBefQmk=;
        b=T3TdvE0kcE+f6205M8S4OwTJIUktJJ/BQWltFdiNOu+ERtU4LvFFCreluSyNYzYmag
         5N81d5ZFzifn8EPKi4J+F/gi/OlJ/s3Bcn3td4BxKdhFyk8HOp6m7vB+gnzwMNzDKM62
         p3Qo7xkrn4mCC8pzzIHRfvRzuinXcyU+BfKsmOL7S2bE/xGIJXSklyeA5kWJGGhKAlkM
         p5jzKf1r9LUMxAM4BDAILGKKFRLp0Lq+oGqyBNDsQrH/9wVzjInUNKys9PVr8CWy7eBL
         UGhFD8Y+YcjYV7LCgcuVY4mdfb/L4jYInFNbx3ivsxXFX6WRDiJiwJD2ZIn/HD8nmEQS
         onog==
X-Forwarded-Encrypted: i=1; AKwUvByhZ/cPHa5XzceeXWhMbqwhykmdLEtBxTSDjeA9Aq/PO2ytebPqvYgp4zyMm9oVbNNa9gy+i+tWjlo=@vger.kernel.org
X-Gm-Message-State: AFuF++mSy8NjzxXhBb8fuZmtsmJ42nj2I+JKoSRRzlaes36RuiFO+Nyo
	gBdt696YCs3Yz8tXvtLi7pJqJO7E2AYMwLU5fBnSM8qO7qnyXquHgHo8hJgaRC4g5LZYZc6Zyqt
	hWcBIk5wf1gHxTsWBFXENyhrDP3cukcgeTdh6ahElpg==
X-Gm-Gg: AYBFou3vDGozAwVwTcQ8iKQs544svm9NyG5+iRoGlNGaOQywXrts1xbn5DvzgHX+XkE
	lceLDQnP/zlHLxs2uq5d+Q4cZR/dfyn9o0NCbSpcaGvSV1qVJTKghusz50uQcrc5ltr/624+Vcg
	zntWW4oTDvaj0eswYYQ3xX+ipT/wpW7PYWOgCUlrOBoh55HDkUxltx5nmTjrO/X9vqbObIoMo75
	ekW53UUb5K/L/Fb5R1d7h7C1gs02GAQZ9WwoifypfJMtuMyN+/CJUMhLTWDH4bvwfD9aJ4dxayT
	o+z1eK13f31Ddfw7BURT7hHqpp0nqA+pM3aI/LZ/WBLvabbZriVt/tGDeafk/Ngv/GAtio31YiY
	BFAH7/o8pIxuo
X-Received: by 2002:a05:651c:4084:b0:3a3:364:f797 with SMTP id
 38308e7fff4ca-3a30364fddamr37950501fa.8.1788166633688; Mon, 31 Aug 2026
 01:57:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831081823.67972-1-marco.crivellari@suse.com>
 <20260831081823.67972-2-marco.crivellari@suse.com> <20260831085432.HdW_Nrqi@linutronix.de>
In-Reply-To: <20260831085432.HdW_Nrqi@linutronix.de>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 31 Aug 2026 10:57:00 +0200
X-Gm-Features: AcwNN1XbAMhYP4jgGNk94lHRcPmzvPU1VsFhwzUUJya6KwgFjOkjJCVWkaG3hvI
Message-ID: <CAAofZF7g4sUk2M-=komtqNzbGAd4AeT68p5JbyFbNg1d6RMYvw@mail.gmail.com>
Subject: Re: [PATCH 1/2] doc: Change dynticks-testing repository name
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Michal Hocko <mhocko@suse.com>, 
	Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 10:54=E2=80=AFAM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-08-31 10:18:08 [+0200], Marco Crivellari wrote:
> > Currently the documentation still mention dynticks-testing.
> >
> > Recently the repository name and the tool have been renamed
> > to cpunoise, so fix the URL.
>
> (as of https://lore.kernel.org/all/20260815083728.15470-1-marco.crivellar=
i@suse.com/)
>
> > Cc: Valentin Schneider <vschneid@redhat.com>
> > Cc: Waiman Long <longman@redhat.com>
> > Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > Cc: "Paul E. McKenney" <paulmck@kernel.org>
> > Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> > ---
> >  Documentation/admin-guide/cpu-isolation.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/admin-guide/cpu-isolation.rst b/Documentatio=
n/admin-guide/cpu-isolation.rst
> > index 8c65d03fd28c..6d8f91d2d761 100644
> > --- a/Documentation/admin-guide/cpu-isolation.rst
> > +++ b/Documentation/admin-guide/cpu-isolation.rst
> > @@ -354,4 +354,4 @@ Some tools may also be useful for higher level anal=
ysis:
> >    runs a kernel tracer that analyzes and output a summary of the noise=
s.
> >
> >  - dynticks-testing does something similar to rtla-osnoise but in users=
pace. It is available
> Shouldn't this "dynticks-testing" be renamed to cpunoise, too?

Yeah, good catch thank you!

--=20

Marco Crivellari

SUSE Labs
