Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AD44D90B7
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 22:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787696189; cv=none; b=cCBSlqWs9+ENPi0FV8CeXqhgjW3367AZ/i+/zaY5hTRcVXr2kQEl01GvSSMkvL6dG7nYMxEBd24b3HFoa0bD415Z2PiXaOHJ/JpIiUUF6a65DVoq+Tnzsg1tfKIMsYd4cysetqV+i3grBgREVgsjTWnRT2qHB/4jhO7HXWFtUmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787696189; c=relaxed/simple;
	bh=ALvTtQS/ZvvUR9gxm8qmzRxg51/e/os61XAFTpQzc/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OoLXqmfsKKxOayyftJLYP/7Bm/K/YaDEhCZWF9NRsZQMyizcmwv/8YiLw1aeK2oAi+At5qXhzqUidV7y259mWb5/KzNzlOJWIjAos/qk63FipJKZ/GAEW6naTUuNv4ZHNZ+jgujR7G62uv/mLdjQDWdWTpghlFouiJYyj7WbR6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bf8e1edc3aso246991e0c.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 15:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787696185; x=1788300985;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALvTtQS/ZvvUR9gxm8qmzRxg51/e/os61XAFTpQzc/U=;
        b=omths4FFt7X16XvoH2l1foBE/+lKR1wdyZSnll4kRzXkR6Bh9Jj7g73hGif4CNBOJp
         Vsx17McGXWX+3RqlWjV9rTwiNZKqgGKcRLsZmTwPjGUVQ7Th7jtFYb6tkSgmd5zKc883
         Ym6YFBkPHqy+aeiThYJxST0thAwZiLWLNCudn/rkDcnW4bH3cWBjtsAW1/cxeuM1wnqq
         26gkMtcVNHlDLzpV7RI2qfsaBYcqWUV27uwKVjOcqPW1ORRPY7vTJeuni+WkVK8HNbtM
         R1x6Pp4aNWs/ma3n/kRPYEEVDzWCYPcFP/4el/CCY72O2Fns6NsFYWobVqq3rizT50uA
         7XSA==
X-Forwarded-Encrypted: i=1; AHgh+RqMSuEGUGARQVHgB+9jTn05f4nhYQ2b9DHVLa+L65mqMQefWOQGenCisviRg1X9XODkDS4WslJbRoI=@vger.kernel.org
X-Gm-Message-State: AFuF++m/9Fyo2N7di/eMzfVRPDojEa8mNjxN0O97h9d1+FSi9vqcdzOs
	9hYoghl59kYLe2Bka7qmLSPsUWlTL8UywOGs9BPeG9B9QAGRZeejsb+ez80c7mZT
X-Gm-Gg: AR+sD12/UoB+pyt89RohMi4QJDOPeLkT61ecbiIwRInCoVJHEIez0fxlcURMEHk73OX
	qQlVOc0nYDb2CFH94MfuomDaoS4+iAvYvAZb1V5okAWrtezlDGFg7s9574Kgau8h4ooiNJwP0q1
	Pa6SQARfvvnA7FkWzBnsHS1acmsfCrWxBHEp8NzmEUzDK1vXQmduvJttOlrhg8BY+C/0eD3M+HF
	xZtx89AYpdkZZzc9Qzku+yO24u7ko4U9fged/2pPrm8DvU6vOVpWGyLjcbs7IQUDbHvVeC6legf
	jlACKF3bTraMOCASxCXXscUwIcAQQoOxYjRgoMSsWEjNmOqIm42R+QqQHFZXpOaJnv5LDXOAIlw
	50S4pq3HcZC8OMYnnbZ/8c1Ky3U5sn56/J7T+kaGIo5MEgLKamzADynZeynSUNqZmCu/+gvL1q2
	/pcOv84+59xlCTyqet8LEH5KyYCFd8TJKvjVfxG7awBeudmFCV1g5DixmfA1L+SttNZxfh5FP+1
	tIweDY5bFH7m5nxq3dJnw1A/Ne9ClcyKImFaAN7lCZ/dIr40syewwWWlTiDsicsmiAgPUjcayAb
	7iwYLJRzM+KT4JrkLGSo5UkAOVeU/zzqbJg=
X-Received: by 2002:a05:6122:32cd:b0:5c5:db2b:5baa with SMTP id 71dfb90a1353d-5c65c5f32a4mr716485e0c.6.1787696185577;
        Tue, 25 Aug 2026 15:16:25 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c66005deedsm130710e0c.14.2026.08.25.15.16.25
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 15:16:25 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-97c940ef65cso153039241.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 15:16:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqICIxZQbhRktslPdv2XLEsXSprDMrqifBKfRdlnNX4wMcKk3DsRzBhJjwFhmFI1qSEmVjH9VTYvoU=@vger.kernel.org
X-Received: by 2002:a05:6830:7104:b0:7f1:ddf1:c731 with SMTP id
 46e09a7af769-7f4c5097628mr2648400a34.13.1787695731676; Tue, 25 Aug 2026
 15:08:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0100019fc572ca94-ec363dd7-3a77-484b-b4b7-f2503a0931a6-000000@email.amazonses.com>
 <20260803022828.75776-1-john@jagalactic.com> <0100019fc5739e5d-bc002300-eede-4c40-9ca8-a277b754496e-000000@email.amazonses.com>
 <20260806043712.GB3560084@frogsfrogsfrogs> <CAJfpegtW4bFn=oNfTipCxhiExaqSXnhXeBd6Uq15FpepqCJaPQ@mail.gmail.com>
 <20260811-baugebiet-hofiert-fanden-3354f4a5e820@brauner> <ab642f3a-e377-4292-b2ff-bc970f5384e8@kernel.org>
 <CAJfpegsC-D0AJij3E=dbKzZCH0nijE7+rpPut-EnRd3r0uCMtg@mail.gmail.com>
 <20260822002111.GA6110@frogsfrogsfrogs> <20260825-hinab-kanarienvogel-mitschnitt-04a662533a24@brauner>
In-Reply-To: <20260825-hinab-kanarienvogel-mitschnitt-04a662533a24@brauner>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 25 Aug 2026 18:08:14 -0400
X-Gmail-Original-Message-ID: <CAEg-Je8d0kKH=kPiG7RDK4jGiTvECyOA_uFkZzbuvDpR+owJEA@mail.gmail.com>
X-Gm-Features: AcwNN1Ug6ZjMUQh0-6_7H39nZVAq6SWCLa31cOPu7pwraCiDoCVhUYh7Q1UxHT4
Message-ID: <CAEg-Je8d0kKH=kPiG7RDK4jGiTvECyOA_uFkZzbuvDpR+owJEA@mail.gmail.com>
Subject: Re: [PATCH V12 02/12] famfs: Module operations, fs_context, and mount
To: Christian Brauner <brauner@kernel.org>
Cc: "Darrick J. Wong" <djwong@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, John Groves <john@jagalactic.com>, John Groves <John@groves.net>, 
	Dan Williams <djbw@kernel.org>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jake Edge <jake@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Randy Dunlap <rdunlap@infradead.org>, 
	Jeff Layton <jlayton@kernel.org>, Amir Goldstein <amir73il@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Ira Weiny <iweiny@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Haren Myneni <haren@linux.ibm.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Gabriel Whigham <gabewhigham@gmail.com>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"fuse-devel@lists.linux.dev" <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 9:44=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> > > Without John's trust I'm not taking this on.
> >
> > Whatever path you and John decide on, I would very much like to see the
> > question of Which famfs driver do we merge? to be resolved for 7.4.
>
> While it is reasonable to place limits on how long a series is pushed
> out (I like to move with some speed myself.) we have two competing
> implementations and that will have to play out. We should not merge an
> fs just to finally merge _something_. The fact that this was more
> contentious than usual doesn't imply we need to merge a version, doesn't
> matter which one it is. That's a bad reason.
>

Well, after 12 iterations in this version alone (working on this for
three years) and forcing multiple side quests on John, I think it's
not very fair to him to keep stringing him along like this.

At this point, I find it hard to believe there's much more to discuss
about a not-a-filesystem that is relatively isolated from the rest of
us. I've been following this discussion and while I don't necessarily
grok everything, I understand it well enough to know that someone
should just shepherd it through with John and just work things out in
post. Honestly, the amount of metaphorical heartburn that must have
been generated by this is insane. If I had any say worth a damn, I'd
say let's just have Darrick work with John to close it out and get it
landed for 7.4.

Ultimately, the question of which famfs should be merged should be
decided by John and Darrick (presuming we just all let Darrick
shepherd this through). This has gone on way too long, I'm getting
echoes of the sched_ext mess... :/


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
