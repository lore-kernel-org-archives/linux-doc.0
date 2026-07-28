Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECD139F160
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 17:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785259644; cv=pass; b=SE4WOiyNbZMsO6WWQ7sUQSfv1f/Elg59UTnwimzfVQDVy9v2yyOW5JS4jttj1HGOLIe8jfP+9ZTug+dsSrd+EwA2g2QsdZewiq0KA5njjHtN41I5+Gk35oqm3NdLjlpluyvXHaOG0fW+jTao8HMNi5nRRWYg4oTNcfTWFlK6G2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785259644; c=relaxed/simple;
	bh=GybRPctHPyRxvyAMvWjyBFSTcGgtNHg2kn4GeDeA8FU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nw7sn1tBVnP1khOit6TWF1IfA/PeNG5gFg5Z+b43b8EYkjkDHk0+wHmuWddzRTWAXGVYeVdK/ox/R++N+dcrKCwb5+xeTceKhc8uD1EMiNTDG/IjdYI2xMsPVHc7JlCKRXBQW54W33u9IHrWddPHEKMkJAeLCA+OKVVAP2B16Oo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YeB3iyIy; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YeB3iyIy"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c01c79467so15771cf.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 10:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785259642; cv=none;
        d=google.com; s=arc-20260327;
        b=TBmjF5NWwyVx1aT6AzqtqBBHCXSagvDxnaMrsFSsPNcpgfSuNp+mkVGnWHeuHwKkyL
         S9SJcE+y9Hts6djKMxTohDJ55ZcvPOV0K7/wgo6h3FsMR2CMmNeeH9R5LMtjZUIPMA6I
         HAkPVRz7uB3Em0H3j5ZSFxkORLnWG36DPPPmiJfIglJDCrFyivnJPPfE8boqB7b0URr8
         ofyhFm+/aoZBxDKt+KseCq9Trzxlx5pc4+hxuipAx8yNaUoOUYBRvH2MfYCe1cWVJEej
         vhb2plwKjOn93/CspOEu4UysJnuA6c8L23GrxTXMJvCrF5VO3pHDQ1A95Ra+rm8oDNWi
         94fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X2E6APFuXL0QO5MYtiHWWH1dGFecBH/tJuYUj2zY9aQ=;
        fh=K4YdfuX0SYnhSoGmHPrPI760bPGlM1XRfMfkpV+Mt34=;
        b=svv+FJfZ8j3AAxmNQTUfGw3JVlCzKu2KBVyak0rBffc5fjYOWLpMQSKhmgUGA3zke+
         aXtRnY1wfzfhxbRJWtmvjBLJJnFu4kCO/VZff1oz8pHnmjfzxkmo2YU5OOBAcGUyUcjL
         bfJLnOZ4jLA+5lNeux753wYEENdl0L0JH61HxW0PZInFHNYGTvejAOuen5SspMf/hNis
         NO6BFEgvygtw1I+Mn97PCS65Bl7bDTrGN+WvdUjMBpj4XnaGD2qvBs2F0p5Sr5cq2k8H
         c0r6pCBX9CyvarrxtpNCl3GaVWU5Zd/pKa7zUHHj621qGNlqJRLtEYT2JjvnalIBh6Rz
         wfQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785259642; x=1785864442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X2E6APFuXL0QO5MYtiHWWH1dGFecBH/tJuYUj2zY9aQ=;
        b=YeB3iyIyDy6srpby9brDUE2rf6sXO+cS6e575JeUcMDGEEAI+CCLzVnm4RyQMbueCf
         orQIu+e7LLh5Jk5LTrlRKmcbkr9tBReEtR2zofm4h28J1stOPX5stbCU+wkAtyitRD7A
         +ZX1S4MoLP241jIuQ83DUebYqGUjfOEpZ+S7oIL4aSitbBTpx2MJcTA04gB901jIa/3W
         EpQI5RrjyRobCNDTXDQzKwe6q+6wdCYi/auCKIhtZrTZ5zzN32UVAEyEEis7jC/8SCs9
         /gfOZIfInMB9tcyFtfbQEbe5VrjZHbWjZfuyQeN5+PEghkJH9zRUu0AGzClyow6UVNAl
         Jcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785259642; x=1785864442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X2E6APFuXL0QO5MYtiHWWH1dGFecBH/tJuYUj2zY9aQ=;
        b=dKT+3QY9BfDLkH4J63sY9SB7kZ4GDT5TNFVY01hQ9AGq1Q/aFbD2IaA6egdiElA+iC
         NXvHfInex0aOiUTvPkpq62UybhaExaGlp4Q2Y3mByWoDeVygJurH/w4MKSyZUtbKFIEl
         6ejs1Rau76s13bUJdPw98fSW8RX/OlVEp5uWh8UeMDDGa7IKnxXFiWVlR8hBAPTPibJS
         wOQPbV0LlzagiXqPqMZP86ntsRyYC7tEWqT1PC0NmxlzCBjq+ITXw+pzg2NHeygkSdRW
         9xm9vSwqhgYEOmmlegx+UUOY2UGpL4DR5glZWSeFCKxeLgBAlS5MeqranhM+XtNeRoTJ
         5ufw==
X-Forwarded-Encrypted: i=1; AHgh+RqZNJxDSTjIbhiVb+iITTHXM1IuUNThUR/M4q9jbkgkgvLTcjQM3z9QUOH7AZ1oZmEpxxr12F7iWXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7hDPFdgm8O/m+AMYZIOuyJ8UAkS51bVT5yy6bBZBPvMEdesVa
	W7bnsfhnqM0PCiHFqjnJ0UnJ4wxHJQhKGWFsg8rVJVYKUqzazLeFzUTXonuZS98+9LZO0Rt/ffq
	DSfLcD+Yep3syB3GDodMreKkmRLYwigy4SIX4S97R
X-Gm-Gg: AR+sD12NExjpgF+Mn/6FccX3UkNNtjY7WkwljHpOJdpMBytJqwqikNcRF3vmEMe2zbH
	N8asCXuPZNm3ppXRGdOvKlVbDKTMUdlpObd1dpnRbT0jUuuhyccRpXo9RDkZxxr11ZTSL7KsRT3
	LS3vKkYsVfgAo0phK0f9S2A7EGjJg9rYkMlv6SMO1LceNwo/xbLhAkgduiWeCBandtnb2mVIkqP
	qTu+JWa8ObVyym6d7WW4a/NGOhy4BtFqiIgn02gcQzmisb1+iqAHnLOEuy4g5kzNq+mnb3G6V6k
	vNy4qfUTLkImw5N24NjPykdR9rY=
X-Received: by 2002:a05:622a:1b91:b0:51c:ca9:3d15 with SMTP id
 d75a77b69052e-529a5eb936amr64182801cf.12.1785259641228; Tue, 28 Jul 2026
 10:27:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727230545.262579-1-pratmal@google.com> <20260727181355.481ebbe3b56425a760583f39@linux-foundation.org>
In-Reply-To: <20260727181355.481ebbe3b56425a760583f39@linux-foundation.org>
From: Link Lin <linkl@google.com>
Date: Tue, 28 Jul 2026 10:27:09 -0700
X-Gm-Features: AUfX_my4-h-mRu6xt1IzheayW3fQeJD2Yt8OpFWkkfPN4RkyCQvO8_8aaLNkCj0
Message-ID: <CALUx4KTL5vnGdPt5L_j8qew=HG=Eo-6jokdA7cPOC648BWW-Cg@mail.gmail.com>
Subject: Re: [PATCH v3] mm/page_reporting: Add page_reporting_delay_ms module parameter
To: Andrew Morton <akpm@linux-foundation.org>
Cc: pratmal@google.com, vbabka@kernel.org, david@kernel.org, sj@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, anshuman.khandual@arm.com, 
	gthelen@google.com, surenb@google.com, mhocko@suse.com, jackmanb@google.com, 
	hannes@cmpxchg.org, ziy@nvidia.com, ljs@kernel.org, liam@infradead.org, 
	rppt@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 6:13=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Document=
ation/admin-guide/kernel-parameters.txt
>
> lgtm.  It conflicts with Link Lin's "mm/page_reporting: use
> system_freezable_wq to fix UAF during suspend".  Easy resolution:

Thanks Andrew for handling the conflict resolution!

Sincerely,
Link Lin
