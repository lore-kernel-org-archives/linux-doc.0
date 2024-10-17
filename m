Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4E61DA61E
	for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2024 14:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729176325; cv=none; b=lqln+TlJ6JTwGpfawmojsPsL9N+74fVopXUyZO8LSF81JBElJ4pXdUGdvB/E0ZmnOXsGA3aM+KumLHHVoP2iH2HrwLBimheGY99jXh6GJIWU0azrIC/FdZP3p2hckBRgzt+Kgk+sVBP+64h4yhySHSkogylR+4yQVKH6mMPk8l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729176325; c=relaxed/simple;
	bh=wxpEnPUPR/5uTo8/QFidqpzx2iJ/f+EeTj40rscTLUY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N3uB9anKua2iuYKilNr2YgwldrCZfopzSmIsXCM42TpeGdTolr/WFVjaQJITmh4QfRC3YrYz8GCQw456PcI4kZYNX0izKk7TUh5ScoqlWvTQ2NlCHlWoZCEGMaWoTQoXXvoADUZ2NQYlVJPfo4gn8D88EB0xl7Yxumb7w5raAvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cs50/oLf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cs50/oLf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729176318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxpEnPUPR/5uTo8/QFidqpzx2iJ/f+EeTj40rscTLUY=;
	b=Cs50/oLfZ1I5xC+ToJ9Gpr7L7A60AVgrFxnykCbVe9hvXGRXBAhoSYmpdI7UWMLeM6hea+
	0zzPDqOn3KW/Ze7Qc8CHGnP1jpA1YLvme9SvVjaVXllMziDM549OrbAs6qJRZKgceeHqbN
	Dnj4BqYHxV/V86piWGg06HE7D8GwmnY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-i0_30RLsOUSpimHfUkKm9A-1; Thu, 17 Oct 2024 10:45:16 -0400
X-MC-Unique: i0_30RLsOUSpimHfUkKm9A-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a99ea3e1448so63512366b.3
        for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2024 07:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729176315; x=1729781115;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxpEnPUPR/5uTo8/QFidqpzx2iJ/f+EeTj40rscTLUY=;
        b=Z2/KQcwW4zD9ZiRpz91ZlLenSMGqHdnuEO4hG3MlYeuAlWEDN5G3cZae2WR+n9LXwi
         R7ndpO5mUPDtbto6h+92OpyXg1ld5ykB28j/gHTVy8urdfPoP3OSYyd1+WC6NMHJXQ1p
         FC72QL+VKI2zMMPY/VzUKehLnlZHrM5B1f3g7JhaHAT8Wj3NOmsiIqbfnlbXmUvWgzjE
         u+Ah7mr+JZJ86VhPOZ/emd4oHF6D70XNlbRNoQpK5T1VH/SE4f8ETmg6iuIlJoELmKRP
         bguFe/vN9WTi2w8jH+xYbuZab0R7c3GyOlJk9cmxbxafEyKN2ygUSlkH2nbJfoPt4xBP
         KMBA==
X-Forwarded-Encrypted: i=1; AJvYcCWE18DPoP6XCA+mUO7NdmO0FTb59/bRmyNsjpk9kqoJ+47oQBwlp11TZQrBM4MqCawrfV+pNUl33Ck=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbXvYQcMqiZHWoogTaAqLX0O5tWtEHbtHG10u9RyutEhKewJi6
	KJ+/rte5XW2YHOf/oOJZDumJ0MzFpOBPbOT/tuJ1FScsUVBNtJLqe2CZQ3G7YX5xfIn5s6EQlsN
	ixwDAg7uTAugBeMc6FYqQWdhe4qfPcCNR7iKavlscBmwQDl9Kw7WW5M07Ew==
X-Received: by 2002:a17:907:d3e4:b0:a99:45c5:339 with SMTP id a640c23a62f3a-a9a34d0ae93mr643409066b.32.1729176315483;
        Thu, 17 Oct 2024 07:45:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExQkfyHcFy//Hqbg2rl4jzcrlAL15Mc96dN9JnB/hqdts0BUtGI7iqAMcORsdlQDKCEyhmVQ==
X-Received: by 2002:a17:907:d3e4:b0:a99:45c5:339 with SMTP id a640c23a62f3a-a9a34d0ae93mr643406266b.32.1729176315049;
        Thu, 17 Oct 2024 07:45:15 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a298433a1sm301653266b.162.2024.10.17.07.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 07:45:14 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 3809F160AB50; Thu, 17 Oct 2024 16:45:13 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Hangbin Liu <liuhangbin@gmail.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Andrii Nakryiko <andriin@fb.com>, Jussi Maki
 <joamaki@gmail.com>, Jay Vosburgh <jv@jvosburgh.net>, Andy Gospodarek
 <andy@greyhouse.net>, Jonathan Corbet <corbet@lwn.net>, Andrew Lunn
 <andrew+netdev@lunn.ch>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, Hangbin Liu
 <liuhangbin@gmail.com>, Nikolay Aleksandrov <razor@blackwall.org>
Subject: Re: [PATCHv2 net-next 1/3] bonding: return detailed error when
 loading native XDP fails
In-Reply-To: <20241017020638.6905-2-liuhangbin@gmail.com>
References: <20241017020638.6905-1-liuhangbin@gmail.com>
 <20241017020638.6905-2-liuhangbin@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Thu, 17 Oct 2024 16:45:13 +0200
Message-ID: <87bjzizt3a.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hangbin Liu <liuhangbin@gmail.com> writes:

> Bonding only supports native XDP for specific modes, which can lead to
> confusion for users regarding why XDP loads successfully at times and
> fails at others. This patch enhances error handling by returning detailed
> error messages, providing users with clearer insights into the specific
> reasons for the failure when loading native XDP.
>
> Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
> Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

