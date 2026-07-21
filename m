Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E757D372B5E
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 16:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784652783; cv=none; b=JIz1HQm/QlwEfInZfZTg8LB/rM+SqlVlpX1LudsuqUyZ6HRAVUq9B8o6l/jUKdKHwS9fE0Sp7RcY+PCOiYZy5Yj3HUGzYxYUeBXcNDM1MbJ1zip2F0uUVpBFATPLW+eNq8zfyOoZ7DJVUEiv+5keZYG4BxSxADO+sMdQLLVu7m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784652783; c=relaxed/simple;
	bh=aub4/Y/qId6fjPmNww3hbFWO0qc3XRYxHnOrlUCtVvQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UTI/Y5rUFfSpQ2gl6GT7poXq0zo2vrgkG6zvKd5ESY0aONRy3qdH1IWltSNx2MiPDha/Qt529Zg2aXwH365LLT+sHdXB88mFDI2oe+UXL/+zs4tzN0VLs0OsGhD3gcZovFoq5qEqiGeXntbllDQ//Tfqr8PbG97m9hWwj+pH64s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ba2sxT6v; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ba2sxT6v"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e086f8e0dso1248528b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 09:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784652781; x=1785257581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hZXQPMt2Tl+5btTT5R4lEmBtsDs0cFC3Selp5kclvuA=;
        b=ba2sxT6v3ay/+1fQfDTpCvV7DZZ2vRnm0XBqThPr0OmfY/D/I7qSAAy0aKCel1TMpQ
         cWEo4EU2c7vvzd8cGrtHaBD0PhLhLfCyJwlV1yjSYft4FEJ0E9otNWmKHuKazEErJ50N
         ORYMToShS71oxaOOTVa37P71CGmhJoGm1GPPbAok6+xS2VSWipi1XqC2KXkeRjTkpCDP
         5cvyOGgYcaZ/aII7R+LOn6Uam8nEEgSsyEj4Yd/n9Vum8pAubAIH7HoCk4uOZZ4imaRj
         I6oJ/xG3sdUFMKbmaZsDkNP7GqrpebNhZXMJUNt1TpP7mI5PO7r2OGF2n8DWJhcqNb/1
         6cPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784652781; x=1785257581;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZXQPMt2Tl+5btTT5R4lEmBtsDs0cFC3Selp5kclvuA=;
        b=ga8V/6qewKtO6TFz25LTHf3cvVKrV02RMUu8bYu7yad9sWw3r2JtN8lMpGnLG762QX
         5sl+F+F0XG0Kag+IPMQJMz8UFsWUfCyKTgs1Kh7nTxXjYAqHmyPGDsp58Jh7onBcQs3A
         9s6lFl/LOuk1miOYaPQVHXEDG1HYyYb0hSEpw1EsBn30Gz+cjKXNg8nHGSpDl/lA1MWB
         SSou9cgL8qy73SFNPifvjMhxsiVWF4pQ5X+m48GyUGsPJCAKwEkMmk4sPqAiG7seRi5f
         3QB6+Yma2zavkgswAwButd+wq44eiVq9hsTkQkg2W339gRsOAmGlNlTouk+dRUnv7HgV
         u6OQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxJA4Ozk5b4q66V8Oy3x8w99oAFzjIr4YdwiIeFy7TbzrESSoGdqKv5cR4zjTbny01J0rKRVpIGYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWF19BbVY5T8BWhkm0IWi+Y1KNM+fweQ0c4g3wbeSbPGmsIB2v
	6YdYlFu1Lrg6ysM2kckbT7XxuiyffYb44K2KEFtY8LtrUZ1webkbJu/Xzp4UX9njGw+N8VwRc0P
	H9x6a7A==
X-Received: from pgbee5.prod.google.com ([2002:a05:6a02:4585:b0:cbb:8616:5536])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1748:b0:845:363e:12d9
 with SMTP id d2e1a72fcca58-84c292a0e86mr18030207b3a.3.1784652780789; Tue, 21
 Jul 2026 09:53:00 -0700 (PDT)
Date: Tue, 21 Jul 2026 09:53:00 -0700
In-Reply-To: <d538bd8eba1058d52f8d32e311c12bf216ff4118.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260720192221.72912-1-absandze@amazon.de> <20260720192221.72912-2-absandze@amazon.de>
 <al6g4VA4l-ZIAr9Q@google.com> <d538bd8eba1058d52f8d32e311c12bf216ff4118.camel@infradead.org>
Message-ID: <al-j7FTIRAECuhRt@google.com>
Subject: Re: [RFC PATCH 1/2] KVM: x86/pmu: Add CAP to disable SW accounting of
 emulated instructions
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Luka Absandze <absandze@amazon.de>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Alexander Graf <graf@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026, David Woodhouse wrote:
> On Mon, 2026-07-20 at 15:27 -0700, Sean Christopherson wrote:
> > On Mon, Jul 20, 2026, Luka Absandze wrote:
> > > The only functional change for an opted-in VM is reduced accuracy: a
> > > guest counting instructions-retired or branches-retired undercounts b=
y
> > > the instructions KVM emulates in host context, i.e. the behavior that
> > > predates the accounting cited above. Hardware-executed guest
> > > instructions continue to be counted by the backing perf_event, and it=
s
> > > overflow/PMI path is unchanged.
> >=20
> > Do you *need* per-VM control, or would a module param (or a magic value=
 for
> > enable_pmu) suffice?=C2=A0 While I mostly buy the "it used to work this=
 way" argument
> > (just "mostly", because that commit landed 4.5 years ago), I'm not exac=
tly keen
> > on adding uAPI that is effectively "re-introduce a bug to workaround fu=
ndamental
> > design issues in KVM's emulated PMU implementation".
>=20
> Which is the bug? Some would argue that timer interrupts running 50
> times slower is also a bug. We just get to choose *which* bug we want
> the guest to experience :)
>=20
> And I think that is a per-guest choice,

Conceptually, I 100% agree.  But in practice, making a per-guest choice req=
uires
a priori knowledge of what the guest is doing and/or what the guest needs/w=
ants.

And so I'm asking, do your use cases have that knowledge *and* will you run=
 VMs
with different requirements on a single host?  Because if you'll end up
configuring all VMs on a given host the same way, then I'd strongly prefer =
a
module param to give us more flexibility for the future, e.g. if months/yea=
rs
from now we figure out a way to provide acceptable correctness and efficien=
cy
that would allows us to drop the param entirely.

> if we can't find a way to do it with *sufficient* correctness *and*
> efficiency (qv).


