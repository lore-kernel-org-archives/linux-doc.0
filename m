Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798424;
	b=ZeNQQTTeGKx0CcCai9sXRg0X3KvVpMdy+uStdZkGA0h40R/+np/QvTFDYgNGUXbzpF18
	 OD/9MfBHz2Pjnr5ea0w+XVgj/zVsgmMvuuMB38AjyNqxDS96LSV3vm3Axd+0mjLlhpiv8
	 xGsZb239egFJMDcOrDZC5RCzflgQy/87lPdGPmHSyJsiC6296zWuZ96H2FR/86RQzAcIW
	 NNMDUBR4ONuhw0Su1adPBptipP54wiFiapuo2S4nHkw7Xap8LeUMyW1RhmHUwFuf48VOp
	 I+snUpvodJaLbv7tvNb5ydTprUTf9bjFZdXsg9ITn030X/JMfR8O1BuEpum8FN+arTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DfVzAJ8JYr3tOeyUpGtQ08wEF3tJXXOK1aQTqHdgZsE=;
	b=eIWzvd18yX04DgQOSfLEc2O/9gGvexBrDd9Tv8jXWIZnd2KsLHCTsNYiEZu4mvJQtXom
	 JcwFicl/LozTiKjjGbMCcovr5dPVxFAHIeC24Hv4aNOOOIz+fxWXSCVEXwwqZ9yEHdzYR
	 /m2/37SdF5ON6NUr8t1pJbg+ETPiKGDXyPFwWYM7LQNMGkczl0Kmu9bMAO77jNd2AAdT8
	 MyUl6BEDZCUMq5T1YUY9CXFgqpuDfP3hhvKrWDQ0zsokuBJUZwwZXR/cdFLM0NPna9O7e
	 /TZQuZuByumR3GCTf2AMIzACvGPzbfsLU9GN+UbI2aYxMWE8807B5a5Gv8zydiFVY4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kaqr0bjN;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B07606A321
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 03:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3B07606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kaqr0bjN
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so1311357a12.1
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 19:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798423; x=1795403223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DfVzAJ8JYr3tOeyUpGtQ08wEF3tJXXOK1aQTqHdgZsE=;
        b=kaqr0bjN+QHNZOPTQJ2d0gdtYA5vBPiqzZjkPR3gzLC/zAlsFH7Dd5VLunDlMve6mh
         m/+tPJ2oXxfrm6ah/ZOBKfKMB/AK1QyfTjV0SSZQJ6QvP6PAoQ7ndUVzPbCTJhObF+a4
         euxOdqg+nVo3UpwlpWc3+BlSsZW6mzMZpzHzneuntMiQRsYl1thsjuk+t2CNmH1QI2Bp
         w7lj0D6kZ+WCTWUd534xL7Xx8UDAPM6BQ52NDMRIRaJX++lwOUKfwP7hMOYdcQhVYyhv
         4ok84pCIKmUsj8pon+pT70i13BLxPHBMqb8/nGy5CsiKYLoBLesG3FM2cYBXpiicSX+p
         xE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798423; x=1795403223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfVzAJ8JYr3tOeyUpGtQ08wEF3tJXXOK1aQTqHdgZsE=;
        b=Qpv2uXoEIE2rrM9PKTCBKOUGA21W1rJ5IKBRYeIlTfW0GCQaGyil+MC7OQiVRmxpf0
         cyxDVaub303g12hqq/NozHnFwfjJNt/bkR1/gHMLWiniY0qobodC95CP2ujHXADhPLWf
         KzkVpYMDJfo25y4jWWENcAs6uyJ8Z2RdE1IHqhj6vnifdcku5+tj0kybYsqod4gzXkdH
         F3Ltt/QDK9WGtXHrafnJ7wZCQ10iP0Fou8W39t/a6MxcXDOL7/xZJedrFkE/h+L2uMuT
         2Q0MshHcch9ZF2NQ/wZ3dMwQcY9Y75pt1L/JfryazuIJDwgHqJPpao8hJgmrx4ICO0Zy
         rTCg==
X-Forwarded-Encrypted: i=1; AL+hErE6mOcGOW42m9NMWTi4KjI0SjIIyF5PGEWe8h6qmZ097tQ2M48u2UNzPwNAGr0ObhV/vl32s0+0Ttw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8av1RKIixgj/2Q6PpIuLFAXMSpbBGMaU+UgJ/jKBabTPw64U74
	S9Lz+X63DZHzDZ1A+F8dmUxOc9K6TiKZgWVwBDA7KIOollbM7DdaQSqg
X-Gm-Gg: AYBFou3Png+BTuxoFkS8rh4bBZc8V9H0ROChu0AQp3C2SdxkCgtJPFmaMIiHgGgeI9a
	9MuKFEsQI5LISJFdReirhoOK8Cqzz8JYXQukReEDmHiwkuAk+tgxpDr+O+Y7cL9RaLXMRnx6akE
	wyEDo6XEePpifoVDqnNFCNDmW0enBZDaiBooiOqHaWnJXMPd5h18vyif1K+CymhqBM02dmCD9z7
	DR21HX6V0LXfy+YwYS/japfDEYqNIfr/+15tyNyzPKAJLyKqhKJquDRHjYNnBLQlXeXcFzWarHn
	VhczrQsEDGNzMaNSD1su0PdeBj5IJIxIGVA0nBjsJ8W7nKPpfAdYJ5YlgIuutPnkijM7UGKN9yQ
	GMdS+IhZV1DjAly0tcjChZ5H2cUh/cCiEZb/oI/mMYAhggoAybaCGp+zRqp7wIgIO2P8hT3gtEB
	f/O3QEhf5B+TpaQFgBlqMX5hk8AMDzoDbQBk1iLeQMQkNkcuYRmdTFucwl8Nef8AAwsiuSux8P0
	mmvm5TkbvUq0RXascuGT4uD51jsmWHgC8zxScwRz8Z+odYtCPzOSotjdgPPZAK4Z4ZRdkiVigRr
	1lscndMGbHWJzhvzL87NugNLPDldyYEImyMOfVxtRxC1bAAwOw==
X-Received: by 2002:a17:90b:5627:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3b1b0a37140mr9756701a91.39.1794798422744;
        Sun, 15 Nov 2026 19:07:02 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb18b73sm14150263a91.3.2026.11.15.19.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:07:01 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id A907E423BF1B; Mon, 16 Nov 2026 10:06:57 +0700 (WIB)
Date: Mon, 16 Nov 2026 10:06:57 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jan Kara <jack@suse.cz>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] fs: porting.rst: use literal string to avoid warning
Message-ID: <avpzSippbZRkaki9@archie.me>
References: <20260924183915.400588-1-rdunlap@infradead.org>
 <hyk4puvpheleitf4kt74aamqex2ytuxpda2iki5bgzoteldf23@pccvy6sdmerx>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2aSM361HPXJ12lPa"
Content-Disposition: inline
In-Reply-To: <hyk4puvpheleitf4kt74aamqex2ytuxpda2iki5bgzoteldf23@pccvy6sdmerx>

--2aSM361HPXJ12lPa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:32:43AM +0200, Jan Kara wrote:
> On Thu 24-09-26 11:39:15, Randy Dunlap wrote:
> > Avoid the docutils warning:
> >=20
> > Documentation/filesystems/porting.rst:1417: WARNING: Inline emphasis st=
art-string without end-string. [docutils]
> >=20
> > by quoting the const pointer in literal quotation marks.
> > (Adding a space between the '*' and the '.' also works but it looks odd=
=2E)
> >=20
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202609231806.ILZP6Fy0-lkp=
@intel.com/
> > Fixes: 025756ee7b47 ("fs: port mnt_idmap() and file_mnt_idmap() to cons=
t mnt_idmap")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>=20
> Thanks! Looks good. Feel free to add:
>=20
> Reviewed-by: Jan Kara <jack@suse.cz>

I still see the warning on current docs-next, though. Has the patch not
been applied yet?

--=20
An old man doll... just what I always wanted! - Clara

--2aSM361HPXJ12lPa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCavpzSgAKCRD2uYlJVVFO
o2fxAP0awLC/NOAhUdn3hqtAYhGUjdvzKU295bC5dTxWWiP9pwD/c/ih5Jvt+/xO
1xbWcqLtQkEpyne9Ow5zvgkmhh7JTQc=
=tb6M
-----END PGP SIGNATURE-----

--2aSM361HPXJ12lPa--
