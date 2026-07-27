Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAAF3F58D7
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 10:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785147800; cv=none; b=C1Df99amucJijFAznj6NDSGwwYh9cqYOqVxS2P8DZC8tDByAkNPTWO4u9m3IjlYsuRuTMO/hJMkAYIcBcX8sPdKObCszmR3X+0HKLc8UOAZixCaa6JjL6XRKd6/EusK5+MZn2kh4ark64LYsKhnsYm17NeSRbEdsO3duP7bTg98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785147800; c=relaxed/simple;
	bh=ySLRE49fqjCghjhGTQCgjjUKLeszyf+kItNvV97jGWk=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=qC0OMd9IL7oiK/WGzxSL1ZIzkQgI1IuX0rBRXOrHjt/wSSp+jzOC8AepZoPW5g6XweKOJz1pGlR3D1KA20CigjQLRMnlwS+u1bLeoTRQOJG6uBNVEQ3wkNUuEATVbISQZuVEN65M77+YmVYkF6TGdDFVB2YxT5q/xv80JsN8o/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b=n3RZuFHF; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b="n3RZuFHF"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92ed3993c1eso137352785a.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 03:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20251104.gappssmtp.com; s=20251104; t=1785147798; x=1785752598; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DVZKW/HowHh3JkNN7GvaevWwLFJTPxZKAxBSNREob2s=;
        b=n3RZuFHFoX8306qXYXZTJp6f8uIt0OxGBpWRJ35tZjlslID8evejPeYmVhpFlelXh8
         8+pOCIEhREOj6/kyGf4h8jpOrNdREzJ2XiflS9AE7CMBXLKfiQsj/9PPqZYLOnv/Rlbp
         4t3viLVb+6aOhUevMfuU+r2HY4a60QFcDct0ki8n64WY8dqBLlfO/eaYrT8KNMnNVf9n
         ZDs1cO/yQFp93mcqbWhfOP8ZJugETmcSQlgAezE3pUQlMhxm72rXkjnR//sySO/lV+5/
         o9xNWQlcfqE8wAiqEOrm/DEFg2SiqHeOC3a6LZS/4PVkHxGqdtGlKr4txM16pTw174Om
         099w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785147798; x=1785752598;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVZKW/HowHh3JkNN7GvaevWwLFJTPxZKAxBSNREob2s=;
        b=m9LaijioCSywHTL4pq/Eck7VLE/UqVcLSw9XkeyzqQWyXCctevVWQOddYlymvucP5G
         4w8KG+UZgukIrjaYRXUsC6oJKNhv70Fs8NXLZLGmbNxcx4Ayy30UzWg0SJdLfN45CNXE
         CGsYwWkBtWwzPqfs4JN6U7RCZ8+v/wN/XsuUEISzNUdtpPvqaRWRfox41CzlSbJNKhPO
         52+vbVbRHqXh9qiI0nTuSRTRRN17iE/jeAH7jwIIXlcKZxVvOUumxpPURz9WSpyhHa6v
         tkEvkQRc15k6aj1VqETeu223jnHFE8NlMdHuX1YRZp7jvU+Ck/E+kL0inIssA6jP694p
         oVTA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6HfMTZDdPzbxFidJnXWlEr3J7sd6ZZM5/cHUyF7uurnitPJBYd2uPwTsWMHpCvUglEMXGh7bVnEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaY5xUtcKE/2fiQsfqHyN965cLb12ofXXO5s0f6hoNdeRqFprk
	TLgJZ8cTm5m7cFSl+Vh0vA8OIZX/KIp9hF6uurjp9JCU4s4VD425qnHulAEUq36qyA==
X-Gm-Gg: AR+sD11WHg4nGkYyTRf2zHldo1+C3INf9NMY19IaJ8M0sC50Z96alGx+OGiR1vGAbkj
	3X3QwdS+0tCl+Y42P9snRRrOuSENMXGDYHW07CmrNJglTXYnqcg2pgEsEdqxdlcIMq0mOHxNVF+
	/9OLLIFVX9WLnRpGVBDOfDVIq0RpzKYrzANOItzA4fJlk72ZNWcrHWc8S3JdMO3A0Pr1kM/hsnD
	7EyjWkVWanLuqlhAxFJ8D0qVSVBndie79ftsREUhUjOt3y4ccE1IYtrI8HVXf2OzyuwFdRiceVl
	jxxuW02kdR4m0Y0ANkoJ2qDH9S0ir5M6ETdxhoczDGIhqjFHH+A1ofGvh2tyZ6vmOK4HfQzdGEN
	h1+q9RPtNzbD9u1SF+QLgReRq5smbxYiRycHBP0xtVsQ7eKLJ3esPuME/j728tX4qAGMNoj19hi
	jorjCv+/GS1H3hljnSZSurDd6hzi8gWooQ
X-Received: by 2002:a05:620a:40c9:b0:92e:c116:befe with SMTP id af79cd13be357-932df75c595mr851097785a.91.1785147797776;
        Mon, 27 Jul 2026 03:23:17 -0700 (PDT)
Received: from smtpclient.apple ([2600:381:b393:15d8:4c70:7d83:4597:b56a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e86d499dsm61759276d6.42.2026.07.27.03.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 03:23:16 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH RFC 4/7] fs: support FD_FAILFS_ROOT in fchroot()
Date: Mon, 27 Jul 2026 12:23:04 +0200
Message-Id: <3ECEDA35-17D3-472E-A01D-45584CF46B85@amacapital.net>
References: <20260727-nasen-gezweifelt-weitverbreitet-d6c0d9f5d28b@brauner>
Cc: John Ericson <mail@johnericson.me>, Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Jann Horn <jannh@google.com>, linux-api <linux-api@vger.kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>,
 Farid Zakaria <farid.m.zakaria@gmail.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 LKML <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc <linux-doc@vger.kernel.org>,
 Christian Brauner <brauner@kernel.org>
In-Reply-To: <20260727-nasen-gezweifelt-weitverbreitet-d6c0d9f5d28b@brauner>
To: Christian Brauner <brauner@kernel.org>
X-Mailer: iPhone Mail (23F77)



> On Jul 27, 2026, at 10:59=E2=80=AFAM, Christian Brauner <brauner@kernel.or=
g> wrote:
>=20
> =EF=BB=BFOn 2026-07-27 00:57 -0700, Andy Lutomirski wrote:
>>>> On Jul 27, 2026, at 9:43=E2=80=AFAM, Andy Lutomirski <luto@amacapital.n=
et> wrote:
>>>=20
>>> =EF=BB=BF
>>>>=20
>>>> goes along way to getting Capsicum's "capability mode".
>>>=20
>>> One thing I dislike about this is that it=E2=80=99s (approximately) a ta=
sk mode. Why should an fd representing a capability represent one capability=
 (a subtree) to one task but a different capability (dotdot) in a different t=
ask?  Do we need to prevent unsharing a userns if this bit is set?   Do we w=
ant to have to worry about any task that could potentially SCM_RIGHTS and fd=
 to a task without that bit set? I prefer beneathness being an OFD property.=

>>=20
>> Sigh, I keep thinking and typing OFD, and that won=E2=80=99t magically ma=
ke it
>> be correct.  All these privilege restrictions applied to a file or
>> path reference need to follow every user-controllable reference around
>> correctly.  So if I fchdir or fchroot to a restricted OFD, my cwd or
>> root needs to preserve those restrictions, and reopening "/" or "." or
>> any other path (via root or cwd or openat etc) needs to respect the
>> restrictions as well.  Putting it in struct path may or may not be a
>> good idea.
>=20
> I think making struct path carry more meaning than it does right now
> will cause us endless amounts of subtle issues. I fear that change very
> very much. That will have such a fundamental ripple effect across _all_
> corners of the codebase that I'm very unwilling to be led down that
> road. And I think Al had traditionally similar reservations as me. One
> of the really thorny issues with the O_PATH upgrade masks was precisely
> the struct path modification.
>=20

The alternative (I think) is to enumerate all the places in the kernel that a=
 path (or file?) reference exists and would want to carry various restrictio=
n bits.

I can think of:

Resolution (nameidata?)

struct file

cwd

root

optionally, vfsmount

Is that it? If I open a directory with a no-dotdot restriction, what can I p=
ossibly do with it that needs to respect that restriction?  Each such operat=
ion either needs to respect the restriction or fail outright. fchdir really o=
ught to work. fchroot probably should, too.  We could just not allow clone/m=
ount (at first?).  All the /proc links either start at cwd, root, or a struc=
t file, right?

There are things like overlayfs layers, but failing an attempt to use a rest=
rictive reference to a path as an overlayfs layer doesn=E2=80=99t seem to te=
rrible to me.

I think that, logically, we could create a struct path_restrictions and add i=
t to struct file and two copies to fs_struct.  And we wire it up into nameid=
ata. And we carefully make every operation that doesn=E2=80=99t understand t=
his fail if there are restrictions, which could be some new nameidata flag m=
eaning =E2=80=9CI understand path restrictions=E2=80=9D where any attempt to=
 resolve a path starting at root or cwd or a struct file with restrictions t=
hat doesn=E2=80=99t set that flag will fail immediately without even trying t=
o resolve the path.

My intuition is that the implementation wouldn=E2=80=99t be so bad and that p=
eople could chip away at the unsupported bits that annoy them over time.

=E2=80=94Andy



