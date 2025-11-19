Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BF117D2
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 00:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763513167; cv=none; b=R/n1c8QagDU7o8fCX08oizrhN02ptiMutFF+1nFjms9h/+c2YYCKhYADnTwBloCpl6dkuHCAA31DMiGBdN6kEovbnDYGDgt0XTfSsfWL/WABun+QYJehb7PsCSe6RFzdsC5nb3j+mbe+uA61fPZJmeMqw5NesQzu8YoJHhqaQdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763513167; c=relaxed/simple;
	bh=2SfkJY4WCc9lkuGZDUVQCjojquhsUe46TlDHbor/AXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hJcm9hSsME45FQBzMVwTwV+ptji/C0aT81TrHGCRuQB2bQXtknX20On7pphrnh0K2FVFfrNjEN2gdvF4hGBoBx33kHciboiLTcuvpzIkk1XzPL+FsM5oC1mJqjGNZ57ieBN3ybqm5L6B+4ZjWERSO80Z3ml7fBE8ux+Pkh/6G3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTR8t/d3; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTR8t/d3"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso10729572a12.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 16:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763513163; x=1764117963; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loI2m1i6xyLqte3KlXwI/N6FlLk9b2LOtEWlW5hvUIk=;
        b=CTR8t/d32rg7P/qdSNClitepd4WnvPeci59mVh9jKGEp7VL1Rx+epaj1S+htBMnlBI
         7u81mZnsplMIpYsmrgG5r6fgGUm07w8c64vVGr4X9gz9qnK3rB55M6A51C1m/lgz0Thn
         ooBQ1dI/ht25VuK5Kwu+BELUQNIYo2/LvqiOiONklGgde0qp6ELbD15navnYEf7yUqWF
         8pguRtI5VxX3SN56gE/o6oAfzbE5zKjpweWeYiSvpaVvbKno15kzk5fo9xgigVNsryo9
         4p/PEGPZGJF3Og+PrQEDi6CbCPPTuAm25ejY/yoQAOmAmrZ20n7xpgcnv6m+grWCpE8P
         j0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763513163; x=1764117963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=loI2m1i6xyLqte3KlXwI/N6FlLk9b2LOtEWlW5hvUIk=;
        b=gLmndmgP68+C+UsLn+y6oCezFeLAlsZBqhrCfgRf9IHPTzSDCiBbZA/j1ZiJHP8BtZ
         p+0UuiP1B0/mQdt/xrNpgjgHlBLhyE9nId7GDlLYoBo2bT561BNLgj6BebNbqmrLP1IR
         64HjwpIBaQQ96yDw8f+hbLNfeJ/TTrlZBMwnR20BeB2FgqRE3mBhx34Bp5o67ZUWns0A
         mKc3/vfMolKGnhiBTA9zGVX1/W0q2EQLbY9E/UOo5jCPmJJ9qyPpzhkUurh95Lpsfzy1
         Vj/JpflTiVZRjLSf1OLROHn3CaHdBi6o+/jt9MAixREAI/IHyK3IrhqV5sqJHo81pPP9
         9Xtg==
X-Forwarded-Encrypted: i=1; AJvYcCUL/HnxIT4e7vjMeUiBLK0+9580locFBS0zz7P1yDnO5xGh/NZsQDx3JRLlVAEQc65bxDIqRgLKvG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQW1YEBVfFJe1GD3EcFW+vJLltBNOKkyXCkaFDQPYBg18WIaC2
	Rsmt11QvtGxTUktWuKKAsm3EV3Ory8F9kf76yMRp3wlat3bN+qEI2xDc4Kfi7Vds1weBO400vcN
	ZJqK6d9PK87jOsPlsNVGhpDOsiff4fuo=
X-Gm-Gg: ASbGnctNjJ7RAzvpsihDH25Y1s2uAI3GjkIKB3cfTgy+4fsaryUVZ1GlaH52x4L4u1K
	Y0w5yl5ADuqDIZNxpVxBuaPWFtKCQlCR/GE+LfFnLx4lMN/jhqcROMMFXj8cWvHbJxvOuhR7QwD
	KcLii2Tvv/c2N35l9pTqeW8nO9GrYiqjXJo8OmE5UUFjJYOYYl15s1IV62i38aMM0SR2icHv3+j
	KPL2TprLze4SRyMQCdl3UH1OmuD6TVXbPQd1VwjiXNOkFR6oR9h2tWL70GUPBn0rZJX037FH7/g
	mGHi1hq6j4fNN1OGSCCINUsvjqhdCRFW8Qh5
X-Google-Smtp-Source: AGHT+IHKMqkDthFKtYfvCVwMYSITSXJVaoUFOv3eLMP9EBqh8xFPyDn9xeDCWp1fry5+1S+80eX3hQ6WLWmiyUtz3wA=
X-Received: by 2002:a17:906:594a:b0:b73:68f5:41af with SMTP id
 a640c23a62f3a-b7368f54466mr1465687166b.51.1763513162635; Tue, 18 Nov 2025
 16:46:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112042720.3695972-1-alistair.francis@wdc.com>
 <20251112042720.3695972-3-alistair.francis@wdc.com> <49bbe54a-4b55-48a7-bfb4-30a222cb7d4f@oracle.com>
 <CAKmqyKN4SN6DkjaRMe4st23Xnc3gb6DcqUGHi72UTgaiE9EqGw@mail.gmail.com>
 <0d77853e-7201-47c4-991c-bb492a12dd29@oracle.com> <13cf56a7-31fa-4903-9bc2-54f894fdc5ed@oracle.com>
 <CAKmqyKObzFKHoW3_wry6=8GuDBdJiKQPE6LWPOUHebwGOH2PJA@mail.gmail.com> <1cc19e43-26b4-4c38-975e-ab29e0e52168@oracle.com>
In-Reply-To: <1cc19e43-26b4-4c38-975e-ab29e0e52168@oracle.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Nov 2025 10:45:36 +1000
X-Gm-Features: AWmQ_bk8QCuKCQLb67DqdaocyJffENaewjAIfRWVrYKjotLKWyJRkrS5UCmlPPw
Message-ID: <CAKmqyKMjZWAvbc23JQ358kyWyJ0ZajHd8o0eFgF-i1eXX85-jA@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] net/handshake: Define handshake_sk_destruct_req
To: Chuck Lever <chuck.lever@oracle.com>
Cc: hare@kernel.org, kernel-tls-handshake@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-nfs@vger.kernel.org, kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, 
	sagi@grimberg.me, kch@nvidia.com, hare@suse.de, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 15, 2025 at 12:14=E2=80=AFAM Chuck Lever <chuck.lever@oracle.co=
m> wrote:
>
> On 11/13/25 10:44 PM, Alistair Francis wrote:
> > On Fri, Nov 14, 2025 at 12:37=E2=80=AFAM Chuck Lever <chuck.lever@oracl=
e.com> wrote:
> >>
> >> On 11/13/25 9:01 AM, Chuck Lever wrote:
> >>> On 11/13/25 5:19 AM, Alistair Francis wrote:
> >>>> On Thu, Nov 13, 2025 at 1:47=E2=80=AFAM Chuck Lever <chuck.lever@ora=
cle.com> wrote:
> >>>>>
> >>>>> On 11/11/25 11:27 PM, alistair23@gmail.com wrote:
> >>>>>> From: Alistair Francis <alistair.francis@wdc.com>
> >>>>>>
> >>>>>> Define a `handshake_sk_destruct_req()` function to allow the destr=
uction
> >>>>>> of the handshake req.
> >>>>>>
> >>>>>> This is required to avoid hash conflicts when handshake_req_hash_a=
dd()
> >>>>>> is called as part of submitting the KeyUpdate request.
> >>>>>>
> >>>>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >>>>>> Reviewed-by: Hannes Reinecke <hare@suse.de>
> >>>>>> ---
> >>>>>> v5:
> >>>>>>  - No change
> >>>>>> v4:
> >>>>>>  - No change
> >>>>>> v3:
> >>>>>>  - New patch
> >>>>>>
> >>>>>>  net/handshake/request.c | 16 ++++++++++++++++
> >>>>>>  1 file changed, 16 insertions(+)
> >>>>>>
> >>>>>> diff --git a/net/handshake/request.c b/net/handshake/request.c
> >>>>>> index 274d2c89b6b2..0d1c91c80478 100644
> >>>>>> --- a/net/handshake/request.c
> >>>>>> +++ b/net/handshake/request.c
> >>>>>> @@ -98,6 +98,22 @@ static void handshake_sk_destruct(struct sock *=
sk)
> >>>>>>               sk_destruct(sk);
> >>>>>>  }
> >>>>>>
> >>>>>> +/**
> >>>>>> + * handshake_sk_destruct_req - destroy an existing request
> >>>>>> + * @sk: socket on which there is an existing request
> >>>>>
> >>>>> Generally the kdoc style is unnecessary for static helper functions=
,
> >>>>> especially functions with only a single caller.
> >>>>>
> >>>>> This all looks so much like handshake_sk_destruct(). Consider
> >>>>> eliminating the code duplication by splitting that function into a
> >>>>> couple of helpers instead of adding this one.
> >>>>>
> >>>>>
> >>>>>> + */
> >>>>>> +static void handshake_sk_destruct_req(struct sock *sk)
> >>>>>
> >>>>> Because this function is static, I imagine that the compiler will
> >>>>> bark about the addition of an unused function. Perhaps it would
> >>>>> be better to combine 2/6 and 3/6.
> >>>>>
> >>>>> That would also make it easier for reviewers to check the resource
> >>>>> accounting issues mentioned below.
> >>>>>
> >>>>>
> >>>>>> +{
> >>>>>> +     struct handshake_req *req;
> >>>>>> +
> >>>>>> +     req =3D handshake_req_hash_lookup(sk);
> >>>>>> +     if (!req)
> >>>>>> +             return;
> >>>>>> +
> >>>>>> +     trace_handshake_destruct(sock_net(sk), req, sk);
> >>>>>
> >>>>> Wondering if this function needs to preserve the socket's destructo=
r
> >>>>> callback chain like so:
> >>>>>
> >>>>> +       void (sk_destruct)(struct sock sk);
> >>>>>
> >>>>>   ...
> >>>>>
> >>>>> +       sk_destruct =3D req->hr_odestruct;
> >>>>> +       sk->sk_destruct =3D sk_destruct;
> >>>>>
> >>>>> then:
> >>>>>
> >>>>>> +     handshake_req_destroy(req);
> >>>>>
> >>>>> Because of the current code organization and patch ordering, it's
> >>>>> difficult to confirm that sock_put() isn't necessary here.
> >>>>>
> >>>>>
> >>>>>> +}
> >>>>>> +
> >>>>>>  /**
> >>>>>>   * handshake_req_alloc - Allocate a handshake request
> >>>>>>   * @proto: security protocol
> >>>>>
> >>>>> There's no synchronization preventing concurrent handshake_req_canc=
el()
> >>>>> calls from accessing the request after it's freed during handshake
> >>>>> completion. That is one reason why handshake_complete() leaves comp=
leted
> >>>>> requests in the hash.
> >>>>
> >>>> Ah, so you are worried that free-ing the request will race with
> >>>> accessing the request after a handshake_req_hash_lookup().
> >>>>
> >>>> Ok, makes sense. It seems like one answer to that is to add synchron=
isation
> >>>>
> >>>>>
> >>>>> So I'm thinking that removing requests like this is not going to wo=
rk
> >>>>> out. Would it work better if handshake_req_hash_add() could recogni=
ze
> >>>>> that a KeyUpdate is going on, and allow replacement of a hashed
> >>>>> request? I haven't thought that through.
> >>>>
> >>>> I guess the idea would be to do something like this in
> >>>> handshake_req_hash_add() if the entry already exists?
> >>>>
> >>>>     if (test_and_set_bit(HANDSHAKE_F_REQ_COMPLETED, &req->hr_flags))=
 {
> >>>>         /* Request already completed */
> >>>>         rhashtable_replace_fast(...);
> >>>>     }
> >>>>
> >>>> I'm not sure that's better. That could possibly still race with
> >>>> something that hasn't yet set HANDSHAKE_F_REQ_COMPLETED and overwrit=
e
> >>>> the request unexpectedly.
> >>>>
> >>>> What about adding synchronisation and keeping the current approach?
> >>>> From a quick look it should be enough to just edit
> >>>> handshake_sk_destruct() and handshake_req_cancel()
> >>>
> >>> Or make the KeyUpdate requests somehow distinctive so they do not
> >>> collide with initial handshake requests.
> >
> > Hmmm... Then each KeyUpdate needs to be distinctive, which will
> > indefinitely grow the hash table
>
> Two random observations:
>
> 1. There is only zero or one KeyUpdate going on at a time. Certainly
> the KeyUpdate-related data structures don't need to stay around.

That's the same as the original handshake req though, which you are
saying can't be freed

>
> 2. Maybe a separate data structure to track KeyUpdates is appropriate.
>
>
> >> Another thought: expand the current _req structure to also manage
> >> KeyUpdates. I think there can be only one upcall request pending
> >> at a time, right?
> >
> > There should only be a single request pending per queue.
> >
> > I'm not sure I see what we could do to expand the _req structure.
> >
> > What about adding `HANDSHAKE_F_REQ_CANCEL` to `hr_flags_bits` and
> > using that to ensure we don't free something that is currently being
> > cancelled and the other way around?
>
> A CANCEL can happen at any time during the life of the session/socket,
> including long after the handshake was done. It's part of socket
> teardown. I don't think we can simply remove the req on handshake
> completion.

Does that matter though? If a cancel is issued on a freed req we just
do nothing as there is nothing to cancel.

Alistair

>
>
> --
> Chuck Lever
