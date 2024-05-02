Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5811042078
	for <linux-doc@vger.kernel.org>; Thu,  2 May 2024 15:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714664813; cv=none; b=GtOxz5rAWzojhbEnmwAJYg0GF3TIfnqTknbsg2IyXvwoDNjdQMSjJqGYYpbmzGbUQfFsBXXjSR78ldbmK961WTJgBeMq8jir+Fnamn3f441l6qCWtPaNga1Q9JUIr9y6m32MO0lJJNOnal60b8pIECVtQ0JVUjiy80rU19Sd+Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714664813; c=relaxed/simple;
	bh=jg2TUDfx+mRm3IrZJUX+wlFepbkQ0AMpgLu5x8T6mpk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SrFfKaNfJBUQ44BIydcEGBSMA6CI6jBS61vzDXIQsr+59uC+gCC4EN1cAtKKSP1Tv6e5pRfieeUj1G2ZK4LKfPPmQdFlXtOAuR2DlU9LNsJoqNsE862F83DMcnIb6QvcZ7n5sVWGqRdgMVGoskxE4934alSv++ajw2UzpE5B9Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=WJrATbKl; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WJrATbKl"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7C6E947C39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1714664808; bh=jg2TUDfx+mRm3IrZJUX+wlFepbkQ0AMpgLu5x8T6mpk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WJrATbKlrWBAmpL/EuWpEUAa3403+LcDenhKYnAJ3bk3q1eiZiM1trwBEfS7xzlHw
	 aaqVfmIUkejECvQJDG4LbbvncJZxtdE3gVa7k1Lo6UG/DRQoCC9DW5daO66dpdtVSw
	 4Q5SP4FxW+MdJQ7f/vYpO78lk3u+DjJWR+YYIadSHmL8z8u31Vq/n1Pi7z/qNmbgXv
	 PQXVsUTLwEmvlfdLocNGdNTZNnqRINtjQcDoqybrBxezzTtudIawpLLMB7rbfx7eB3
	 5w5jIZITne8R83QjD/GkrAfY841gctg8IreOQmDKMAadz/h5nSMb3PayyjM6lnRhv2
	 uhBA/rloj9bQw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7C6E947C39;
	Thu,  2 May 2024 15:46:48 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>, Tsugikazu
 Shibata <shibata@linuxfoundation.org>
Subject: Re: [PATCH] docs: ja_JP/howto: Catch up update in v6.8
In-Reply-To: <20240502085610.111739-1-akiyks@gmail.com>
References: <20240502085610.111739-1-akiyks@gmail.com>
Date: Thu, 02 May 2024 09:46:47 -0600
Message-ID: <875xvw8bdk.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

QWtpcmEgWW9rb3Nhd2EgPGFraXlrc0BnbWFpbC5jb20+IHdyaXRlczoNCg0KPiBDYXRjaCB1cCB0
aGUgdXBkYXRlIG1hZGUgaW4gY29tbWl0IGU0OWFkODUzMGRlOSAoIkNSRURJVFMsIE1BSU5UQUlO
RVJTLA0KPiBkb2NzL3Byb2Nlc3MvaG93dG86IFVwZGF0ZSBtYW4tcGFnZXMnIG1haW50YWluZXIi
KS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQWtpcmEgWW9rb3Nhd2EgPGFraXlrc0BnbWFpbC5jb20+
DQo+IENjOiBUc3VnaWthenUgU2hpYmF0YSA8c2hpYmF0YUBsaW51eGZvdW5kYXRpb24ub3JnPg0K
PiAtLS0NCj4gIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL2phX0pQL3Byb2Nlc3MvaG93dG8u
cnN0IHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pDQo+DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy9qYV9KUC9w
cm9jZXNzL2hvd3RvLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL2phX0pQL3Byb2Nl
c3MvaG93dG8ucnN0DQo+IGluZGV4IDhkODU2ZWJlODczYy4uODcyODc2YzY3ODk2IDEwMDY0NA0K
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy9qYV9KUC9wcm9jZXNzL2hvd3RvLnJz
dA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy9qYV9KUC9wcm9jZXNzL2hvd3Rv
LnJzdA0KPiBAQCAtMTEwLDcgKzExMCw3IEBAIExpbnV4IOOCq+ODvOODjeODq+OCveODvOOCueOD
hOODquODvOOBr+W5heW6g+OBhOevhOWbsuOBruODieOCreODpeODoeODs+ODiOOCkg0KPiAg5paw
44GX44GE44OJ44Kt44Ol44Oh44Oz44OI44OV44Kh44Kk44Or44KC6L+95Yqg44GZ44KL44GT44Go
44KS5Yun44KB44G+44GZ44CCDQo+ICDjgqvjg7zjg43jg6vjga7lpInmm7TjgYzjgIHjgqvjg7zj
g43jg6vjgYzjg6bjg7zjgrbnqbrplpPjgavlhazplovjgZfjgabjgYTjgovjgqTjg7Pjgr/jg7zj
g5XjgqfjgqTjgrnjga4NCj4gIOWkieabtOOCkuW8leOBjei1t+OBk+OBmeWgtOWQiOOAgeOBneOB
ruWkieabtOOCkuiqrOaYjuOBmeOCi+ODnuODi+ODpeOCouODq+ODmuODvOOCuOOBruODkeODg+OD
geOChOaDheWgsQ0KPiAt44KS44Oe44OL44Ol44Ki44Or44Oa44O844K444Gu44Oh44Oz44OG44OK
IG10ay5tYW5wYWdlc0BnbWFpbC5jb20g44Gr6YCB44KK44CBQ0Mg44KSDQo+ICvjgpLjg57jg4vj
g6XjgqLjg6vjg5rjg7zjgrjjga7jg6Hjg7Pjg4bjg4ogYWx4QGtlcm5lbC5vcmcg44Gr6YCB44KK
44CBQ0Mg44KSDQo+ICBsaW51eC1hcGlAdmdlci5rZXJuZWwub3JnIOOBq+mAgeOCi+OBk+OBqOOC
kuWLp+OCgeOBvuOBmeOAgg0KDQpBcHBsaWVkLCB0aGFua3MuDQoNCmpvbg0K
