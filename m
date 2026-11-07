Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794077276;
	b=NtNOr9dfGPpyEC9mQY9vt6v8xa3h4Tx/D0E9DYOVa95FEDTazIvTAiWVBtUCpONgtKXJ
	 UMDYMCLtYaFFRZcGubGnDdZ67pj4LVik2/Lt5krmgyuCBqFKs02q6NyCR6FuV70Q3Wm3j
	 u7AXDK6P6aW07pIu0vI8lnU7/ktuISCxh5mfkEZne4WqF1+kO8HmUmg3MpmRC5yDDzANR
	 vJ58rMvjw+QHTYyM1e3aIzyy3UCltP3aVdUhN/FkgjzhOReoatCDZnJnDgH08tO/EUN1W
	 qXWPEe2QkPM/32qsZts5RWCNqmyDroAX+Qr0wrg0/+kKp4Dgz2kNj+iRfylI6uJrtlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794077276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DWojXY4nDMT9rtwg6h/b477SwUuLPC3ITyeb/WPBYqc=;
	b=HvMvkPPP114a9/JrdVxpYvWcRVlFnjgJKOVaAOvtig6cgc5bnEspaDUhtID2ql5JUxct
	 L0+Jzke5eukrSZAu/4IbOtYdB6PlnadZyQEjCrgBL54XSGUAj5sDreYs6/VXqaaaeCW/l
	 gUz2nELbyUdUCxWRkg3noKQVsU6hzPWZIPlTVZtrK9tTAfMUMxuKRm7dYBIMHDNBf8BPC
	 Lxs9yDQr7dSNiirEgITmsu8sYNwkg6jxQ+l6+qpfgdgCt5bcKaZHiCKid0PFSMXlpWZy+
	 1ZXdviW7etggX2juOrwB3TLd6Y0t1u/SDl1F1S3pcjaguVm9FX6pmroVzofLinDTeXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jDsWkgNe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8CC606A32C
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 18:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB8CC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jDsWkgNe
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so1981457e87.1
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 10:47:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794077274; cv=none;
        d=google.com; s=arc-20260327;
        b=bhthSCFaVK+JK1ueO4UZcP8prS6FMZlbEICV5riy0DTDgQzkkKYurd83Cz71/jZEJ5
         0MKmleb3wMCvHRT4cSStya5snWvCQhTANXAWmB+hF4611qBjNvAV2vZS+30Q6p5IfL7S
         IqMTIg0jdmSdUTRBA2UnXF/7KJQ1QXXxPuwWrCsqrnuTAlKrVYwqJXDCz9jzfPLAsMnD
         8wGqXX4n9VOgugQUOd20CLaAUoGln4WedhA+MXEYb7crHE1BGqxzw6PEu7U4YCh2maqW
         ryHilDOspEr3wkPmbvIQjWvftaNvQElsYryTOX4bU6sqAD1TpNCFcjpYTzOOL60SvkWq
         WEUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DWojXY4nDMT9rtwg6h/b477SwUuLPC3ITyeb/WPBYqc=;
        fh=SXABXQjYYeZvAuVg3gJSy8atGVao8OFVQBdnhCvZMpI=;
        b=DB0m3WNU7mkn+1ZeFyYXCk+qZjGVwhCythlZv7ZV+pXsauBaJ+z5Wl58Z6KV0w4liM
         vuX+loVyYIkRp3+sdIuywXyPyZZi6sZeZ8J4aQIZQo8aaWLea7iDRsv01BrPm710jdpU
         bRwCqCd6wb1JW0UR0eAg0v9euSExUHvWNT0ktZjfUbP/oqE0H+tfRcZrJZEd/a6OQM2m
         Fkk7AURLMp5qP4Antxi5WHuKuNUU2lIsivNFATqrczeUT3wJTOSsvuudnLOhxn7d4Ye/
         Hxx8vuSb7TmSgNV++6vYoOw+IXAOLglZ2GYVfCsQHjCZ5UiMjvLl6ReLHDrCf3IRk9ni
         OE/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1794077274; x=1794682074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DWojXY4nDMT9rtwg6h/b477SwUuLPC3ITyeb/WPBYqc=;
        b=jDsWkgNeFsbdQ7qKqbpHSGOmDkfyI4OzDS2pJc6+Irn0QHpBxG9wPbmRTDmNnDdzS5
         db8t7KSVAGcHE/QtRbNhFDCWnX4uqUr1mEeZuLglr9YUDK4k94+gZZ0e2v5XDqaLBMAu
         GF2mKtLq3tPj9IBZGN3w1gGTAF0jFrsZMFCKcXAmKrirJiOIjEcuysNg1l24IqICP4gV
         r2UQCTmuYiVAi+q/1GU8UDVYE1+IZodom/D3RIz9GtMMMdasHTqHTXmlylMP0IcXnVJO
         5lWPTzglrmuISOXtwRoPqefa1QyXnIQk56sGTTb2Rf1nGsDNJzcZ5BPRF2XDpKcZZ3TD
         g2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794077274; x=1794682074;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWojXY4nDMT9rtwg6h/b477SwUuLPC3ITyeb/WPBYqc=;
        b=Fw60rlhFZ/jajOp4sOB8uZoFoz1H8u3EJtjhSyXyNOqFIymaq8GDvDE8rTYzALhkU9
         ZCyI0FQGpgINvh5OM2LNvXjIPnfEDdhrd3aFuBzx5hZGErYMNgO2XBl1sYETnn1jod+s
         51XjpnNKai2OGEvGC6IEDWTe8x4JO3Om25hf/N5rs8Wah99p4Vmn0/vTjWv2fVn0wBeQ
         4J0M6lqZZjpja360uHSqq3iFMIehUwlC60XculzTyOYOPqkwpkWmHGabCQkgHYXIfacU
         n/3BiRZ54BBFJAy+nFt4bOo6QIWb6jWIUZzg8HzAQbHzZ44nJZwGtTFbzHoFhcHrhpdj
         3C9A==
X-Forwarded-Encrypted: i=1; AL+hErGun22HMcsdORuJyz40Pf6dZdNOuWgSmUBe08GJWsGwQB+8NmQnUnJ2PtTt29RfrNBNndDl0F05M4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gZ0vExJ3ysTNxdOgEV0DiXx7xsR4H8+yfMH6VSVZyNnK5asiU
	5X0D11hYcGM8c2ZoyGMrxlHJzajwi0ox+bVrilx1YIIHUtZ2ypvJ3FEkZlm8b8eJxBkLV6RpwzE
	KXDNbLga+y9qjlP5iSyoiCkMwVmS97Nlglz+Bs4z+
X-Gm-Gg: AYBFou3nWGOfu9eCZOAetwIRzKu+HgFQQuoJXEKxZiBA0sjmW/M76+vvuwS8IyqsScV
	Gu9JfsF7LehT+4ZsknL6SKrQA/57HdGE4VO82piVOtvgyD9HVzXKeP+3Y6Y/LjOf1UPYH4Cm7Fh
	Zm5fmIzzv+ENkBwI/4lVgaeOZHkbrEQjZQ7RPXvIvAJbYYg9IPqKL8DvQvaON8Vf8Vk2ieylr+V
	PM1nzO/sT00sWGg/6FsLUK9qArbOSxTpx2OHaRRbsQRN6raLEuitGMP9KqoJQ9FxsfFjJIjYzoE
	5zNdfJo0vLnIY4p5B4jD0GXRxCS9nydWIDTK21fq+vrbvl7Z0bUCVebSNraXD+oQra2m1Rclx+0
	7pnDtXdEaJtI6EaxhVkiqj7ib2678mp9yYQ==
X-Received: by 2002:a05:6512:291a:b0:5c0:ca1:9dd7 with SMTP id
 2adb3069b0e04-5c00ca19f2bmr594320e87.35.1794077274068; Sat, 07 Nov 2026
 10:47:54 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028221705.3915340-1-halg@google.com> <CALCETrW9ygriu54gxiHFLEd5+hJminQo0r8Jwd63wR69Dj4W7w@mail.gmail.com>
 <20261106-befreien-addieren-eislauf-e09212803534@brauner>
In-Reply-To: <20261106-befreien-addieren-eislauf-e09212803534@brauner>
From: Andy Lutomirski <luto@amacapital.net>
Date: Sat, 7 Nov 2026 10:47:41 -0800
X-Gm-Features: AclHuK9s0dgg3FDVqp4WbjYQnA0hebDpEpxOAgz_VjLjRP_HfRjeTpRH9DX274k
Message-ID: <CALCETrWa1SBLcb5oWjqjgzZvKvCoHjmYFk=Lf5ytEM9uqm5jYA@mail.gmail.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
To: Christian Brauner <brauner@kernel.org>
Cc: "Hallgrimur H. Gunnarsson" <halg@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jan Kara <jack@suse.cz>, 
	James Morris <jmorris@namei.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jann Horn <jannh@google.com>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	KP Singh <kpsingh@kernel.org>, Jonathan Calmels <jcalmels@3xx0.net>, 
	Casey Schaufler <casey@schaufler-ca.com>, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	containers@lists.linux.dev, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 5:13=E2=80=AFAM Christian Brauner <brauner@kernel.or=
g> wrote:
>
> On Wed, Oct 28, 2026 at 03:56:11PM -0700, Andy Lutomirski wrote:
> > The whole unshare/clone flag situation is getting out of hand, IMO.
> > And this new thing makes logical sense but is really about reducing
> > exposure.
> >
> > Perhaps we should instead have a small list associated with a userns
> > (extensible in the future) of things that the ns's admin (i.e. whoever
> > has CAP_SYS_ADMIN relative to the ns) may do.  That list could
> > include:
> >
> > - Create loopback with sensible defaults for ipv4 and/or ipv6 (i see
> > no obvious reason to separate them)
> > - Create tun/tap interfaces in that ns (and attach them, etc)
> >
> > And add a very simple new API to do these things.  Actually, the
>
> We've had this idea in the past and I think it is reasonable. I had
> always thought that we should expose a system call to create empty
> namespaces ot any type. Usually I'd be excited about that but I think
> that point is a bit moot and I'd really like see whether we can turn
> cells (or whatever other name) into a first class api.
>
> The problem I have with the patchset as written is that adds a lot of
> moving parts. And yes, I find the CLONE_* and UNSHARE_* flags plus
> sysctl to be suboptimal as well.
>
> So the TL;DR is that CAP_NET_ADMIN + userns =3D
> CAP_NET_PRIVILEGE_ESCALATION 10+ years later. And this patchset wants to
> put it back on a leash.
>
> So why isn't an aggressively stupid solution to this problem to split a
> new capability out of CAP_NET_ADMIN so it covers the absolute minimal
> set of things that should be allowed instead of doing effectively the
> same thing but split over multiple apis?

Because we don't actually have a clean way to make a list of
privileges that are, in theory, harmless but are hazardous from an
attack surface perspective and assign them only to tasks that ought to
have them.

But maybe we should invent such a thing.  It would be very, very nice.

Other than that, I agree with you.

>
> Anything that is reasonably advanced should not be the kernel's
> responsibility to delegate. I really think the old privilege model where
> the kernel grants control over a whole subsystem is inherently flawed
> and is much better replaced if you have the means to let userspace
> services grant and delegate resources.



--=20
Andy Lutomirski
AMA Capital Management, LLC
