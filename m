Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964173CF664
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 22:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778796189; cv=pass; b=f4apOfhereqtzsivBD8Fg4U+sOIp0eLSS5UIC9LkWxvIcYZZnbcXyXDCPksBkYHoSp+Rvsw7T8L/7Qd79WB1kWybmSlXWL4hvFjSk0E5/rLM6/ZX/kO/GdSCkOrYvHURZ9Jhkd6fWZceHfi2maN2WECdeOySiY+vgDcPUS+au5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778796189; c=relaxed/simple;
	bh=h0YtsE5yy20zwIvV3idZ4HQlY6G6gZTn0lEw5AKZGfk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=gbPAmrD6qBJ/eaR3CGgkw8ASKIQmX9Zsp48G1BH3iMXfulyA7CKxXMOkXLQTOv7L/M5YazH536lVMyPjHfm60m39kDdNa0A4BTSj74HraafembGPQR+IhFEJYTHPb/ugiS7BVoSSEtVgvNo0KPR5vrI1IbJg023WxVrMhHu/Dgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WiHmnRpO; arc=pass smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WiHmnRpO"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-47cbd444fd0so5514415b6e.2
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 15:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778796186; cv=none;
        d=google.com; s=arc-20240605;
        b=IlNG3pq1RKnBFFIN1qIZuPUF4qnyRPL+ij5Rh7jh7EmKYge5Zc2CAX2Q7uEcAwVl5e
         cRYiCOadyDE4eOn41a2tKyPf9jWU/dCXSQ0lSMWc8XCHEAOFZF6yK7hZYfPRwBlqNEHj
         jV0TxUrGGFH0YIzOfkpGDx+mJXLLZ/7rTLvLvkX3zfR/Gbk4ge0B0KIp195ijjCeZceN
         nvq+tL1p+WKOAlwIcBTD1XGuQZB1Fymk9oVYiWkRdd/HdVdjQwmbXKz8xVd7L8OGMi1I
         839ldI9rj91ciYKd75dDoockwg6oT/3u7AFQeDG57eDksoz15HZknGQd2f3DZFo+eN7C
         rTEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=h0YtsE5yy20zwIvV3idZ4HQlY6G6gZTn0lEw5AKZGfk=;
        fh=udvD1t8nereVb2p/AwRV2927cqXvn7/klbRkl7N69gM=;
        b=F4EtTR879Nnwc7aCIz420OD96cT0+U0DVscanRcpqxLOg15Xqxe9aszQ5OEn/bXK1b
         luXCKds6tL8ZmUD0vZ+mqqD6O05WqgEOe7sMpXcpJ9II6EOtBrpWrPQpCU4FfCDSrtvn
         zr8/5MM+C0JgCVMl9a8bomQetdxYieT3fEvHgc4A7BQnv4tB9bsDy41mxBueH3heaYQ4
         0za+awPUIiB/80O+TrXafqCqTvy5U5Zg01zeQyNW3pXkrFFHaimAlmqexkqQJRIzsebB
         wPrrPpugw2gp4fpikdZYRDj7k7aXPsy0hO4J8+iDxb8rt0iSU+6ncvg3GQ/iF2ge1x1J
         Y6+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778796186; x=1779400986; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h0YtsE5yy20zwIvV3idZ4HQlY6G6gZTn0lEw5AKZGfk=;
        b=WiHmnRpOUqziVwa+sFZYZ2EMRCzayYl3LaH5hUk3v4GGchqhfx2QXQJMpNbfrWGM/3
         VKfYPbLcgAZMNa23UYU1PuK5f9uaOfkdzzk6jfbsG+FzJK9qMZOxECLH49d+05zu8+jt
         6TBGCoT98Fp83/gqzkpRoCePbODBOpFHLjN5bq3zRvAIO2DMCccXl6c9H20WHdzZD77W
         Wf5iRJadUCQaJKqQ9ppSw4C2QH3m2Sp4AyXH4I+SeNWax93UtZzOFa0v8SAGb83es88c
         dANkT7ztAU0LDd1A4iJnW0rRMxN4C0+90NRBq52s+aleT36i0yH0m2CnK8ac1BoHjEvh
         HtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778796186; x=1779400986;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0YtsE5yy20zwIvV3idZ4HQlY6G6gZTn0lEw5AKZGfk=;
        b=Fsx9HMVmkXqTnLNt0B2BMQ7NkHc9RKGEeNjcq1Z7Dq03uMWzrCU6bL3PV9Z3Z6Cq68
         +jQkDe+RgHWQIP4vYU5P9RVVQ31kwI3jtDyQ5IDf7q3aSrFACj3zSO4ozy1tcCixr8o9
         wpQenhDF0ZsbKIuF3UX4ictg+ZbFQqtJjDxgz7cTG8tyrBWXZHMNhpqOzh3B1qGOcNlP
         XBb8zivt2m2Chb6WFXjnln/yuVo3pAHb5inKlctWkpRWDFlo8IVqgq3SmUqg+glpQU7k
         dhtCOpbZMwjdnFIIaIOCHKHhYIZ5bgovtloWCLvEUASwIobc9zujAytjdGxTf7Hbwd1B
         ezZA==
X-Forwarded-Encrypted: i=1; AFNElJ9B730XR7C2YkO2UCT3hlpiF0kYmHFWDmecpv2PzhRyzAvZS1aZp9taSiCg7/XiBntP0jTbtP89Fao=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFGQgucZ/UpWKBl4BMAH+TV30DdJmXcyORQpD4cd3FejR49BRc
	RDUZ7LE9vuf3BURL7DzZJ4CkPRVDpg0WT+ld7o4/uDoysfD14YTvaAtOzNFXq+ebmfvgAHT8T8k
	yk4euQCcrnuP7AZ2upojZ3/FiApWAODg/C8gM
X-Gm-Gg: Acq92OFxIndvU2trlE4WaZUIMptsE7JB0CEy5JheRDRoL311hnaOaKGv3RTrH2Wj01K
	wxCZBiiDe1QmRvpfpn2OCNIQ7/NXPzbrerZF7yb7BY44REMxw647pWnFsXyb/8QpwvMlYuQfQp1
	ExPKtIdXC9TBqYoWwUnrruUCxdVyQzDzY2N5xk+0zm6qIl3777ChcTL+majmniOEWxdsv3Rrn6a
	OmchqhA3iB8d6xqBvhUd9tx08O5LnA56+K7IyQmeMTo1Z/9kZZOZp277pn4YLTcLu7mwsKavCNE
	g+RD+h3D3+VLZQktulri3WR/Cx3u62efkqZVhDmX8lclJN+k9hX9QZ6pZAq7pAWRM4ninNfJZ0u
	tKAyPmveJ
X-Received: by 2002:a05:6808:524a:b0:479:faf5:ef56 with SMTP id
 5614622812f47-482e55c4c1dmr1149707b6e.5.1778796185584; Thu, 14 May 2026
 15:03:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 14 May 2026 19:02:53 -0300
X-Gm-Features: AVHnY4IaaSgR3VZQvRBPZYMC8hfRQNz_MYAJh1FGeJmfNShf4UaIqiAIiPW3mG0
Message-ID: <CAMAsx6c4R1z=yAAt3bXzZLmLPQQnBCd_XYzCT8yM5EWD6uSBNw@mail.gmail.com>
Subject: [RESEND/FOLLOW-UP] Documentation/translations/pt_BR patches
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Corbet,

I hope you=E2=80=99re doing well.

I=E2=80=99m reaching out to follow up on the status of the patches I submit=
ted
about 12 days ago regarding the Portuguese (pt_BR) documentation
translations.

Please let me know if you=E2=80=99ve had a chance to review them or if ther=
e
are any adjustments needed on my end to move forward with the merge.

Thanks for your time and assistance.

Best regards,

Daniel Pereira
