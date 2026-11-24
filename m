Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538186;
	b=TeV9PnkEtOtI5hFQbTO2eRX/7RaQSqFO/u798jRf2eILam5iT53H+BmdErlTgdOpyH+j
	 xSgDh+gz4ZGvQWt8zARWJ3FeYHpOV55s5+c5IaZN/xN37h0UrA9a6ncOS5axQ8dfj+WW1
	 bsbVrFM2w40va8ce0alXSYwz48OGwndFSlsrtHlXs6CEDrmQUDNiLrWUad7N6dkBLnIf0
	 pHMGKxLAvTXby45dpRRTsqkJV3zKckpm7jtk/v4hjWlRvphcBddD7zMNGqpu8RumH1FvD
	 90Y08ZDx1hvP8k4VMxMLJkLDJxL6xNqV4h/WHIdSD7sBt9oQqZ+6ZEjdVkKOZ/9TwNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=qvYwNBiIdSxY1ryMKCuJ8Xp5CwhF8vXQvRGoOqfiz+Q=;
	b=sDQYRtuQrbUEOy2AMsYt7r/GiNNjJZnsjin5QYC58QHmBh+DAWJJC0TWVpsT7cqvvo2F
	 mlsmb/9j7m3w/aIu5l3UW/c2p4DsJRkQPq2MDMxM5tAULGEIhZll/qYqHQl9X+QpNMxdV
	 KhGdyQwSxJ2Rlt9EKsvbkaX/a7v+wv/jyXNTuI+ecljc3iDaz1D1lYdu/9DxVQywc2VRx
	 SLi0GUr4zSeAYawNQcPwfxSP7QSv5MT6jxkIHI/3pkyNfO4iN2TFxnJ+bLmFFrGZl9nB4
	 KqV0ZEnNBiPJwuubYVPsfOWU2lDxt6HA0NCEtN3JF5RlnWQ3e0UlpATHp2YqyzK0ZkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KNMG4n6e;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB34606A323
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 16:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB34606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KNMG4n6e
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f04ad2c46dso27949855ad.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 08:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795538184; x=1796142984; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qvYwNBiIdSxY1ryMKCuJ8Xp5CwhF8vXQvRGoOqfiz+Q=;
        b=KNMG4n6e2D2p0ePKYdVnnqC+xmPY4eU+i6suMxwCdLWC4vK5WeNQNS42eCI767BoZl
         gs3vtmySBpRIiU4uvvZnCODrvNxvZ8epDrUY8w+mNhE18jCz4oBzDKGNx7aZ8DV4zv1S
         /sGYoDAhoFmpF899683cVg+yFsYWeBh8I6M9yXpBE3/6aHGLqSVmPkORCkIc7w+55upY
         qibWPy3pUkD6KR7Ivwig/n55zTj5AUnU2bWbYAil5nb8uBjJ0DSn06HpltLkJJIovU6h
         fOcEwGof59hH7z6cZCRtIT3pdwHg1RgxU6SFzBzRgtoF8L3Q31aRjlM6MSnHXTIFnJHP
         eIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538184; x=1796142984;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qvYwNBiIdSxY1ryMKCuJ8Xp5CwhF8vXQvRGoOqfiz+Q=;
        b=G65h7hS3fFOKGVZ07hdP+v4CGjnosmi93HvmouZtWkgUZl70q9YyjaHzs+aNR1bmYp
         s7dtjykL9oqaamCkacqXcveoTKxhwu7nnViygZ7zteMX30tvm13kSVTbmdsge9xFp+3n
         LOBGVtqepJeTPHJcGunnsrRMgsNYN/pch8gRDdgudpL+s+3KeOAADYLApMmpBeZ/lk/B
         q4iJv8iSEVhlpDqHaTSubbPY8QfSrFDf71g4imS9iQVWR0nPjzmlPDxQ2G7EwC8eXPFO
         ylNG3jHtSqr1TR0M8hrZKf/CPcreXzUkC7w8ecE3/MQPVcvK3PdD/jRUuvDIwM4sJrx5
         5zGQ==
X-Forwarded-Encrypted: i=1; AL+hErG+K3ZzuXpP6jGU/O/7b7rDTIq+Zx5WXyARlv7xYaU8nYcxuDCCw+B43LBBcwrqioZu7/WWAW7EiPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DGgQad83InIahlyPyrb8a5W871mDLxrdYIjjVWNYI3B21UNh+
	RadSUQoIA0mNiRuqWPfPKj1pXs/wBYA4n173NkzdMm1cq29TngiJwqMD5lDbTuIRCg==
X-Gm-Gg: AZFdTZeBp2UXGQqi+XJkYHlIGdtIlznO5CSTWJPcY1CBCQPlcqjelxL530HvNY6lc7X
	nmOhD7zUt0FICbRN9/sL3xDU2CzY2CDavUBkQ+RWZSfRTJRD97YeiDn4l0P7GhwmrgzcfiS/Hjb
	/8/JtdLS9CPf/FzmCor+5O/6qRoQ3+gOXZrhWYXmfeTCh4tTgIbqPBTe2ybEXDJO8+LNGbySfKw
	T6NriaFnbJ++FaLx/LJsw7T1VrzS5vZzmcvwNouCKky4jcBz2YTeGwiciMa6dRuKaAgY+dZA7xs
	j1PnvGdzgjxsHg1KgE1ncAH0/KtXX2nn+0gLIO5rsc9ZAgT7ci1AkPXD+x+9V6LCRGrGVbItNPc
	zuDXFxyFemV796zAb0m0K1IRkerEswkdaJgdbv7m275YLPr5Emp4bbIvJjnC0oatNRFNA4KOX46
	aGiozzoVWaQJKqiArW0R5Hz4FrzCBFSVuPs8/HMsZDCXvlIAqzqgh3p4bAu43cv93WBiVeaSKky
	7F4Ng4Hd3g1k3PnwCwe5vPVrt+f67ngSsH+OwCDzj1q0Nyhg8IwDFcW+Kv9gMI9IGTmQqTQX9mv
	PrccmEiYxIoMXro5HG5MSTN1WAwP+IsN7k34V3Vu+3LjpMafNZS3hLel36CW7mpJ
X-Received: by 2002:a17:902:eccf:b0:2e9:64b9:a333 with SMTP id d9443c01a7336-2f03f17c766mr149220465ad.19.1795538183777;
        Tue, 24 Nov 2026 08:36:23 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120830sm71740805ad.61.2026.11.24.08.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 08:36:23 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 08:36:22 -0800
Message-Id: <DN3L5XQDSVO9.1NJFYQJTS16ID@google.com>
From: "David Matlack" <dmatlack@google.com>
To: "Mike Rapoport" <rppt@kernel.org>, "David Matlack" <dmatlack@google.com>
Cc: <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-pci@vger.kernel.org>, "Adithya Jayachandran"
 <ajayachandra@nvidia.com>, "Alexander Graf" <graf@amazon.com>, "Alex
 Williamson" <alex@shazbot.org>, "Alex Williamson"
 <alex.williamson@nvidia.com>, "Bjorn Helgaas" <bhelgaas@google.com>, "Chris
 Down" <chris@chrisdown.name>, "Chris Li" <chrisl@kernel.org>, "David
 Rientjes" <rientjes@google.com>, "Jacob Pan"
 <jacob.pan@linux.microsoft.com>, "Jason Gunthorpe" <jgg@nvidia.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Josh Hilke" <jrhilke@google.com>,
 "Leon Romanovsky" <leonro@nvidia.com>, "Lukas Wunner" <lukas@wunner.de>,
 "Parav Pandit" <parav@nvidia.com>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>, "Pranjal Shrivastava" <praan@google.com>,
 "Pratyush Yadav" <pratyush@kernel.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Saeed Mahameed" <saeedm@nvidia.com>, "Samiullah
 Khawaja" <skhawaja@google.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Vipin Sharma" <vipinsh@google.com>, "William Tu" <witu@nvidia.com>, "Yi
 Liu" <yi.l.liu@intel.com>
Subject: Re: [PATCH v11 00/13] PCI: liveupdate: PCI core support for Live
 Update
X-Mailer: aerc 0.21.0
References: <20261118223704.3286085-1-dmatlack@google.com>
 <DN0FL1752MH5.1FSZE620OJBM0@google.com> <awKlfqlQYhphXCvf@kernel.org>
 <DN2TQRX57C04.ZT5UUS6AQ1L6@google.com> <awVjqLFrXY_PCm7X@kernel.org>
In-Reply-To: <awVjqLFrXY_PCm7X@kernel.org>

On Tue Nov 24, 2026 at 2:15 AM PST, Mike Rapoport wrote:
> On Mon, Nov 23, 2026 at 11:07:04AM -0800, David Matlack wrote:
>> On Sun Nov 22, 2026 at 12:19 AM PST, Mike Rapoport wrote:
>>=20
>> Hopefully I did this all correctly... This is my first time sending
>> in-reply-to fixup! patches.
>
> This is my first time merging !fixup patches and it seems b4 managed it
> well :)
>
> Please check I didn't miss anything:
>
> https://git.kernel.org/liveupdate/linux/l/lu-pci-preservation

Thanks Mike!

I checked the updated lu-pci-preservation branch and the code is
identical to the v12 I had prepared locally.

One commit message nit: "Freeze preservation status during shutdown"
ended up with two Link: trailers, the original v11 patch and the amend!
patch:

  Link: https://patch.msgid.link/20261118223704.3286085-12-dmatlack@google.=
com
  Link: https://patch.msgid.link/20261123190045.2166865-4-dmatlack@google.c=
om

whereas "Adopt ACS controls in incoming preserved devices" only has the
original Link: (not the amend! Link).

Not sure which is correct.
