Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810643;
	b=IuEZ1jbYb+YJXZH8Y0+lFcpzqUauVuxqviAUrKca2D8++sgUvmGxPyWqsoSIDwpNWoMX
	 Ed5Ss7rueiD3HJuLXFJvu+ukNnpvS9sNMGFC9fAWuASHG0D2uIfoqAis/F0YxCFCRapKj
	 D0PQU0JAQw4V8zmyIx1MqRENRsBUXmk7eitJHAJ/f6ZLH1Q1Ys3uRWh4SPJ5Vq2CyqYg+
	 4S/tW6HR8IdLzZEGHn9cGVT7yOtXnQe3LjLcFhSCK9KeFKXgqRLWPRolrZlHzpjHLGy4n
	 KbGpSNF1PbUqdAW306bhw/9FT0La233mF9cFvzJGn1VUkU2p5559dLju9tIAbL4ywFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810643;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=I7kpJ9bmVWK/UO5I+NSSFOntWVhRXJuKLPMqQRb2MYM=;
	b=T+s/8Hh1HCdxNzu7kG/YY0kHx1tbGU5iTlIiAsAKbn+reGgGtQ3Blwo5+8NDx3HUAYgP
	 oGkKve+c3gSuNQ2cqheGkVZ1xcQt9ifIH7lIt/jAl6MPsxw6w4t4eegjdOY/jo41YpAGn
	 bZ/Aaflc/HDAYyz1IDQFYK1w55xO1kSebUWSjm3d+MC3nFRt0iTQrrpw5ixNgzOXhl+K2
	 xJgcYtO3VzgeuRziRak2MEujmM5P+MI5NuDfxHBT+vR24el34LhraZq/WA3JN6BHyP20M
	 2SQuE9mqILdw1mSrL//8p8iaE56Y/rBap20SVomRuc/cSWxDFkYFWv1txgl33pJ+B4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=keTZX67M;
	arc=none smtp.remote-ip=91.218.175.9
Received: from mta0.migadu.com (out-9.mta0.migadu.com [91.218.175.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C49606A326
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52C49606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=keTZX67M
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=19ke9AC0ONOuEpkyW1MiqquFiHABSQgTQTbt1nq39WY=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793810640; v=1; x=1794415440;
 b=keTZX67MWO7g+YCbimIGYsTaPw9RafSgoiBFyoT9h6F/3Vf7ggEBkJfzHH1fyx6GDRIzX9q5
 zoHYSy3B2gTIXsnnLZgbG1nzmg7XKnGTl1cftu+9/luTzJ0QRpCbhVe29NcLnSyqPClASFOciav
 H/JDnqjgohBx1dg3ZMCUgEn0geynWvkAQyIDS9dwggoyqUaqk/83Qfdy+pca+pcVpj5ym2eqLq7
 EbV+F5g3PTvZ15B1y1pJBm3gb6PpV8yBUyaXGAExqEnalOBMgNkGGxIIWeslUOJBLnGxWAlPX0L
 djg5vAiSmYPMje05MprwkdElE2i6zbjtRaOJsYhoWeLoQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7a3a2425bbc08809;
	Wed, 04 Nov 2026 16:44:00 +0000
X-Mizu-Trace-ID: 7a3a2425bbc08809
X-Migadu-Flow: FLOW_OUT
Date: Thu, 5 Nov 2026 00:43:49 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Weijie Yuan <wy@wyuan.org>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] docs/zh_CN: improve maintainer/pull-requests
 translation
Message-ID: <autgxXMPKmncF3vq@wyuan.org>
References: <20260905-configure-git-v2-0-ab194db8c6b9@wyuan.org>
 <20260905-configure-git-v2-2-ab194db8c6b9@wyuan.org>
 <96be0e40-f9aa-41b1-90c2-3c209b5091a3@hust.edu.cn>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96be0e40-f9aa-41b1-90c2-3c209b5091a3@hust.edu.cn>

On Wed, Nov 04, 2026 at 11:58:50PM +0800, Dongliang Mu wrote:
> 
> On 9/5/26 6:06 PM, Weijie Yuan wrote:
> > After the last update to the Chinese translation, the English document
> > removed the explicit section label, replaced the configure-git
> > cross-reference with a direct path, and changed "tree for forever" to
> > "tree forever".
> > 
> > Update the translation through commit 3a1b9c4d8edb
> > ("docs: Remove redundant word "for"").
> > 
> > Remove the abandoned Chinese section label and point the configure-git
> > reference to the Chinese translation.
> > 
> > Some of the existing wording did not read very smoothly, so polish a few
> > expressions. And also correct some Git terminology.
> 
> Merge the above two paragraphs into the first paragraph and keep the line
> "Update the translation through commit " at the end of commit message.

Oops, yes. Will do in v3.

> > Signed-off-by: Weijie Yuan <wy@wyuan.org>
> > ---
> > I did make quite a few changes to make the reading more fluent. However,
> > to some extent, this might also be unnecessary. If you think there are
> > too many, I will remove the less essential ones. Thanks.
> 
> It's fine.

OK, thanks.

> > ---
> >   .../zh_CN/maintainer/pull-requests.rst             | 127 +++++++++++----------
> >   1 file changed, 66 insertions(+), 61 deletions(-)
> > 
> > diff --git a/Documentation/translations/zh_CN/maintainer/pull-requests.rst b/Documentation/translations/zh_CN/maintainer/pull-requests.rst
> > index ce9725f4674c..4509ec2a2bea 100644
> > --- a/Documentation/translations/zh_CN/maintainer/pull-requests.rst
> > +++ b/Documentation/translations/zh_CN/maintainer/pull-requests.rst
> > @@ -5,19 +5,18 @@
> >   :译者:
> >    吴想成 Wu XiangCheng <bobwxc@email.cn>
> > -
> > -.. _pullrequests_zh:
> > + 袁维杰 Weijie Yuan <wy@wyuan.org>
> I had some internal discussion between zh_CN maintainers. The "译者" and
> “校验” can be kept to motivate old or new contributors to submit more
> patches. How do you think about this?

Actually I agree with this benefit and I did mention this here [1], but
I also can't say no to Jon's viewpoint [2].

Take it further:

From what I have seen, keeping these two fields does have that benefit.
I also asked some past contributors about this change, and some frankly
admitted that they wanted their names to remain on the page to satisfy
their "vanity". Without these fields, they might move on to other
projects. (I have no comment on that now.)

That said, given Jon's much longer experience, wanting to keep things
simple makes sense too. There have been several requests to update email
addresses over the years, and maintaining them indefinitely seems
unnecessary. As I recall, one recent suggestion was to stop updating
them and leave the old addresses in place to give credit to the
affiliations they represented, such as Alex's alibaba.com address. But
routine changes, such as moving from gmail.com to outlook.com, really
are a nuisance to keep up with.

On the other hand, if we do not accept the update of email addresses,
leave an outdated address there and a reader actually tries to contact
the translator, getting a bounce because the address is no longer valid
is not a good experience either. So it makes sense to leave the primary
responsibility with the people listed in MAINTAINERS. A reader willing
to dig a little deeper can also use git log or git blame to find out who
worked on the translation.

So.. I dunno.? Or as I said, I fully respect your decisions on this,
because I'm finding it a bit hard for me to weigh the trade-offs here.
Maybe we could just let Jon be the BDFL on this one. ;-)

Thanks.

[1] https://lore.kernel.org/linux-doc/atDVxZQUiJfsqEBr@wyuan.org/
[2] https://lore.kernel.org/linux-doc/87o6cvrs27.fsf@trenco.lwn.net/
