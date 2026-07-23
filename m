Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4903D331E
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 06:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784789754; cv=pass; b=eLxp9yN9k4tXy593s8nlhZMKD5naNGd44AdOenXb785ry1UtdiWDcrj44ARn8zJu5/khCTFnV110qA6/IaqNDDa/DPObMax21JMI/LL1qqayGBsiYJzs+fDSw8gG8F54/Zaxj49WksBQsnGw7iyH6O7VeavFii5xyBDehYASKdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784789754; c=relaxed/simple;
	bh=7xavlvPgaj2aZOYRfaOcUw2KPrv2zI3pLKx85cjIG00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exs1vR7fLrGKny8V+D8QLLtDaLagfIiP+XyeWjBu4eLPNketY8E1qeEKtxccoHDlUhaqbMYvCthN9TVjtSl/ZULQmLKAVKMHrSW41RTC4dhExqsXsBJMITiV69+/v/4hR5XGEGbbKkWxwpS7dcXNdbSjjar4oqG0QMAupCwy2v0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=kM6hJJwK; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="kM6hJJwK"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c0c68aa31so2349101cf.3
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 23:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784789751; cv=none;
        d=google.com; s=arc-20260327;
        b=DpEPyZS4bD4uXPwQ2XBL4uZuLPpdmdZPauc/iWZPHMZnRGDjF/hgSfIiVZQb2u7T6V
         kwpl5OCu8SeQdLvZPrIA+8+dZb1okw9BTd0GaH1ik0GaoyRFjaOIH/LIT8d2RrH39fvZ
         JUS8kebAhpyYNG7CzCyGJOeGZPKOBcUNG4nipuM1Den6ukI2qJZ4ZZeso/d6PxPYbuap
         6oLClxYkXEkM8V/+aSTx2sPIKhLLWiq/OUf2G2AR9wEQjOdwEk3FcHOYqdME1g3fq9pk
         WtZCVP7UnrpCAvoQLBrQreQKfqUhvNGMgblj2l2TFgHb6g9imtoLAi+EFDfH2Y9hChQF
         xklA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/L/US/G+XEKajQPS4lkAeBu5twJB/EgGo9GV13H6UZU=;
        fh=Zyal4AwJDrg724TFIL1D302dvroJtFjISuDUJC1oeRs=;
        b=ht1OvPbT0vDtgPA0+iqMxE2v1vYtbTfj4SsqPu1B2phCIkvdTHOr6DHIDuN3Ombg2j
         /ITFpswxzSCGrwHcbfdJShee5zZ5E1gIJVI0EBKX7/ADMYAg/u2LHyROYxgcvIwg5hW6
         Rz5SQjyEvel6CI6U5Zfp1bEhfVpWdsE3TQPKpd5MV7mhhf1evEYBaC8z50NC2c/3Lydg
         PLFsDZkT1Zz+L93x1fUOajDvKz5/Cm+z3OaRDQ5p6WWZRreGkbJ0Li86M4rgayfl+yvU
         OvOxe+WrLrFdRGQpRWf1v0aiq71dtvp7i2nyhdfkDT9cIS2rrJ7ZvJN1IZt97W4OZWYG
         66UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784789751; x=1785394551; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/L/US/G+XEKajQPS4lkAeBu5twJB/EgGo9GV13H6UZU=;
        b=kM6hJJwKfJqbN6hUs6EU1W3ElYn+UcXqPNu1Q6KVSbFegjsM69aZq8+QXN6D3y10ok
         qiLQMbszRUL9Earf5oY7MEgL7UpDRoX0yABx9vP8sUwsyKELbcJhjx9cGqdoGchOaVWJ
         1fxpmviavdF+wLskwjXaJf0RC52HQGiOf9m5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784789751; x=1785394551;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/L/US/G+XEKajQPS4lkAeBu5twJB/EgGo9GV13H6UZU=;
        b=F4f2Xhw1T6Quny3OhMzrqc74N7aHKXkKEpw222bcYbZq0JEPLg+zxiBWAtiXIReLvG
         wUegMIctt2qTCekO4fjodaGGjFd29Vjh8VjbAH1fkt+To6Mi31qQtxDRqR0kaY/tonFY
         CvXlLS/Vw8gm9PAbCEcJ3nCfAftvJqJfpHWSBqoUNHjzCdhUagfzSzC07gYYOzFUwrvF
         QUkX66REGGGrhoyAPFTMw8VAeCkw8RYs1dLgnyTo2jl41QejPquUlsw5vBfTWdvTVQcT
         ocBwshkSLP8z4m1Xy4BAW11CyIdlNKmTMD39Fls0ehCqN4+/4PYrjlFEjMfL/Q+sGH1M
         WvzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPureRiAzt0R4Sx19u7hMYAoYzBnoSthhons9jQPIgp5P/DtkruiBt1sjglSqGFklfhsciI9pi2VI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/S/k+FpnuMr/Bb46NyJjNZa7ACbm9KmLwRRc516nZEtGqkTve
	/VQ0wqiVb53NIgWNhACW5M9eoygxAvO2aqSMcA+vsR4YOq7FvINx6RRNY7gUuddUhRWodDbgLIl
	tX4OrNxDWa76TaLvRe2jAqELU8q9KwfGQ52CbzMM2nA==
X-Gm-Gg: AR+sD10YfNkrFgKYyiVucssQolWOtNm7Im20X7p0RaJzpGKnQZFXSWek1S7lHJ4i9DM
	nvxKuIV32NV7deA0jFeEiRIPZKUiVh21Turvv3EACw/PuZMf/6aYCdEWW8I8s6zLeZ6Vu135D1r
	QFfb0ndnaMzBOfC5nK8vIrf4mcqvdInVcw+qenSvTG3ijL3z/wkrDdKD133YRCgvHdKmIYPj2A0
	vV4wZbiEpLjOPDryj5ByKrEEhuhIZIhJ0QOjkiqkZ7VLdPJYT2HE+OyXpjjdTU6WDWZ14QQOybs
	ITA/02FuF02xB2LfzhssA0VKSUJgnqPf2YQ8wuo=
X-Received: by 2002:a05:622a:2cd:b0:51c:7b12:5ff4 with SMTP id
 d75a77b69052e-5283dfea04bmr15949681cf.80.1784789750870; Wed, 22 Jul 2026
 23:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720034358.68714-1-john@jagalactic.com> <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
 <CAOQ4uxiEzP2e=cRw-AiGxtSv6WMSA5yR3cmgrF97s7ggU6wzqg@mail.gmail.com>
 <CAJfpegt9PwHksYhsQZeCsW0eooXVVihyieTpeHMmC-+Pq8BWaw@mail.gmail.com> <amFMUtTB4SmHdYZx@groves.net>
In-Reply-To: <amFMUtTB4SmHdYZx@groves.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 23 Jul 2026 08:55:39 +0200
X-Gm-Features: AUfX_mwm61XvzbEAWjZX7-oCx0aIcunUf-H5-PKtYcEgLU4ucKjhPy9XCcc8KUQ
Message-ID: <CAJfpegs81UPgqh3XsvAAE6PfDOiPcMceLZD7p9SRR+HaVZbgTg@mail.gmail.com>
Subject: Re: [PATCH V11 0/9] famfs: port into fuse
To: John Groves <John@groves.net>
Cc: Amir Goldstein <amir73il@gmail.com>, John Groves <john@jagalactic.com>, 
	Dan Williams <djbw@kernel.org>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"fuse-devel@lists.linux.dev" <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Jul 2026 at 02:32, John Groves <John@groves.net> wrote:

> I will make this high-level comment: After reading Amir's initial reply, I
> concluded that the requested changes push famfs past the breaking point,
> and therefore the only way to keep famfs suitable for its intended usage is
> to pivot back to standalone. I do think that may be best all-around for fuse,
> famfs and Linux. I don't see any way famfs makes fuse better - it's a very
> specialized pattern that doesn't fit in a passthrough-filesystem or
> block-filesystem shaped hole. And I don't think it can comply with the
> "nothing famfs-specific in GET_FMAP" objective.

I can say with confidence that there is nothing famfs specific in
GET_FMAP that is actually being used.  There are some unused and
redundant fields in your struct that can be removed now, and we can
leave space for future extension in the extent format.  Adding code
for unused features makes little to no sense but can add significant
burden.  Allowing extensibility instead should be a much better
choice.

As Joanne mentioned, adding extent mapping to fuse would be a
generically useful feature.  It's been on my mental todo list for
10-15 years.  Sure, we can do that without famfs, so...

> If famfs is standalone, it can only ever affect customers who use it, and it
> cannot be used as a general purpose file system. When famfs is in fuse, it's
> mashed up with code for hundreds or thousands of other use cases. That's not
> a win from a risk management standpoint, and it doesn't make famfs better -
> certainly not in any way that would mitigate adding a lot of state /
> complexity / baggage to famfs.

The risk of standalone is abandonment.  That's a call for the VFS
maintainers, I'm not going to stand in the way.

Thanks,
Miklos
