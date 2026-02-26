Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1633396D2A
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 09:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772098139; cv=none; b=XivdQeEh4LUMzVtmGeV5R8shI+Tk2DzDOzyNrKTKs34DwJZ4ZhVrgf5hjPCdQf4aeJKCkcygT/aWAeEooizUrlHJ28eelsIlgvbB1sAqNmQGEsNAZI9r/tN3gd+aJlCI3I7k9YLFnr0aXJ2KNcZiqtTgvSpsxHy7XXOgpC3dJ1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772098139; c=relaxed/simple;
	bh=DvmNYGhyGPcviKkSp+bVGHg6C3uepRL92yrgil5pNGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srtEOz+HQB9I+vpDXprIiqzqrUw5YbSdGLM4S89kiO81NvvolWSm9j+svQNbKbIgBYranjthy3acXEBw7f8S3Oa0SwluSYU1K3pTZNuMJzSF0HAJmmyxLLIYUrCTDep/zEWPMG9GkWtZvnYpqvpkDep6Jn2Rf2z4/MziQxOQ0Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ig9S7SfN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ig9S7SfN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819A5C19425
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 09:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772098139;
	bh=DvmNYGhyGPcviKkSp+bVGHg6C3uepRL92yrgil5pNGI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ig9S7SfNYfXbJx5tavyDBcb4TFLfNY05ShX2sZbKbCa5Y6+NiS94U5Ilj8nDthDww
	 gr/OW/B5vhk7RYWdZ8ol69cC8nUNO6jS4v2I1VJNM8mISso99Zh7yBJsoMa4sPvEIS
	 Y6QC7PUazHHHvFKu/DAxXKcS7gjYyZBEcikEvR7AJOZ+q/6Z1ecHEenBSyI5Q/HJpD
	 l8sMnUX1xJme/6FWkoWge4jq1Wbfp5dmS5Vt2z+uwpTZJppTgGvR249Nxh1C3Kt7BU
	 qNlazcqZrGXeSK8++fSRMtxkOhtCFlGCcnJEFiNCig8Og9c8bpZMTwa7P/G30rIe57
	 XsviF7f2aW4iw==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65f89c40547so2257502a12.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 01:28:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWe76vo9aXh40Wbv5oURqH9CDiTzDlTxGe6X5uBEueDUiPWl/8mNSMT1Q7RCIiQPTIHTznCPHpcuR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVGgpbDXjGbA1V30XzMLSZ0GQKKY4/t/O3tTYwl2T+5IZqnoXm
	ZFhgEKRbt55oaAgJo2g043u3inDKMSzQcgwL0bueRUnyCKXIA3LRyz5+yd/08sc/jwRz+Z0QC1d
	1p06/o+TxG7nUeW+Oj9H4vzsnMyZMfWU=
X-Received: by 2002:a17:906:f585:b0:b8f:d2a0:c283 with SMTP id
 a640c23a62f3a-b9356f0260bmr120493066b.1.1772098137974; Thu, 26 Feb 2026
 01:28:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226020615.495490-1-rdunlap@infradead.org>
In-Reply-To: <20260226020615.495490-1-rdunlap@infradead.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 26 Feb 2026 18:28:45 +0900
X-Gmail-Original-Message-ID: <CAKYAXd84GaSYX7bijQMkTM9yr+enDEN5fKLsUegc6cphO__jgg@mail.gmail.com>
X-Gm-Features: AaiRm53M0RdXPQelOzRBjPOkbPr6jFJWyznMRC8cqcvjl2o1jqykJLA_aXNFKxk
Message-ID: <CAKYAXd84GaSYX7bijQMkTM9yr+enDEN5fKLsUegc6cphO__jgg@mail.gmail.com>
Subject: Re: [PATCH] ntfs: repair docum. malformed table
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Hyunchul Lee <hyc.lee@gmail.com>, 
	linux-fsdevel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBGZWIgMjYsIDIwMjYgYXQgMTE6MDbigK9BTSBSYW5keSBEdW5sYXAgPHJkdW5sYXBA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6DQo+DQo+IE1ha2UgdGhlIHRvcCBhbmQgYm90dG9tIGJvcmRl
cnMgYmUgdGhhdCBzYW1lIGxlbmd0aCB0bw0KPiBhdm9pZCBhIGRvY3VtZW50YXRpb24gYnVpbGQg
ZXJyb3I6DQo+DQo+IERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvbnRmcy5yc3Q6MTU5OiBFUlJP
UjogTWFsZm9ybWVkIHRhYmxlLg0KPiBCb3R0b20gYm9yZGVyIG9yIGhlYWRlciBydWxlIGRvZXMg
bm90IG1hdGNoIHRvcCBib3JkZXIuDQo+DQo+ICh0b3ApDQo+ID09PT09PT09PT09PT09PT09PT09
PT09ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0K
PiAoYm90dG9tKQ0KPiA9PT09PT09PT09PT09PT09PT09PT09PSA9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBSYW5k
eSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCkFwcGxpZWQgaXQgdG8gI250ZnMtbmV4
dC4NClRoYW5rcyENCg==
