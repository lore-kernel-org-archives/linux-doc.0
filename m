Received: from mail-108-mta99.mxroute.com (mail-108-mta99.mxroute.com [136.175.108.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0B43016F1
	for <linux-doc@vger.kernel.org>; Sat, 10 Oct 2026 13:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791639123; cv=none; b=qF1lO4Nf+AYVn0jZeJyXRDl7eMYyTJg25dcB6Qt+IcrQdRyy5yz7HabCeJIQHddEC/6LOnEpHF4dqEKv1YDC4yN6AlUjb4xwy/oRL+uOz8Aw7YqJtHWULZHodnjg+Afz7VFhWocqnq36GMysg7iEZXcEsh05qyyxn85YM35a+8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791639123; c=relaxed/simple;
	bh=+DQHzTJj4pKU9M8v5vedPOhPXni0dNumF8T9dcCZYfk=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Mime-Version; b=Y1Rg5/iN8xUhS/qmGtgDfTOhVpB5+G8GjuW8W6nkmixvFEtqdJBeruOq29r32kjnN75MWW7k3COySFwv9v/8pMO3Ba5amgWiOawL6YFS/rq9zTTew+S5o7MCM7kvZuqhNn49kU4AXGm2Lpu6mgJMy+YM7WlDXjQttXA3UuGtpwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=trevorgross.com; spf=pass smtp.mailfrom=trevorgross.com; dkim=pass (2048-bit key) header.d=trevorgross.com header.i=@trevorgross.com header.b=NU/GpYyn; arc=none smtp.client-ip=136.175.108.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=trevorgross.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trevorgross.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trevorgross.com header.i=@trevorgross.com header.b="NU/GpYyn"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta99.mxroute.com (ZoneMTA) with ESMTPSA id 1a125feb07200028b2.001
 for <linux-doc@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 10 Oct 2026 13:26:50 +0000
X-Zone-Loop: 5d257a6821dd73b850fdfa471cd3f481e23274ab89b2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=trevorgross.com; s=x; h=Content-Transfer-Encoding:Mime-Version:To:From:
	Subject:Message-Id:Date:Content-Type:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mdx2yxsl2x17hOZK9ruh4v3MLbroFt3cMgxXOHxxqkE=; b=NU/GpYynk/G+flHYKIY/Cb+5db
	/7CaLAEtOSKLgwAR/JQdzR0lE/W24oV6Tvbc6pB+sW48PX4vSM5/Ls5i43CDlp0vY7vRliPZADa1o
	duOg1IKpiGtqxMmdkzQgiQmvT9sljc0KnKo87SD7WItkU765Wbx0vmWnfqBUqTIH6s7GMmc4bPXpm
	IBMBFDsPxFSVGLL61z9qq3g+SZa+C16+iaFlk0qgR+rxxiZULttn2NMJ8LoqtWKQUAOsgT8JgTHT8
	9nrxzx4zkWhJrzRO/i10mCcH3DikfWWo99WHzmOCLm1q+E1vvdZmCy/jnXaZKO1rgH3BkrZOkAfJs
	h0z+fP7A==;
Content-Type: text/plain; charset=UTF-8
Date: Sat, 10 Oct 2026 13:26:44 +0000
Message-Id: <DM16Y87BYFP4.2R2A4FBXBR9SZ@trevorgross.com>
Subject: ABI documentation on refspecs.linuxfoundation.org
From: "Trevor Gross" <tg@trevorgross.com>
To: <linux-doc@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Id: tg@trevorgross.com

Hello,

Not sure where to ask so maybe somebody here knows. Is
https://refspecs.linuxfoundation.org still maintained as the de facto
platform documents archive? It's rather out of date but still about the
best collection for those, at least that I am aware of.

Assuming so, there are a few docs that I'd like to request mirrored as
they are either in danger of going away, or the version on refspecs is
rather outdated:

* The most recent (to my knowledge) ABI for 32-bit PowerPC
  https://example61560.wordpress.com/wp-content/uploads/2016/11/powerpc_abi=
.pdf.
  Source is still around at <https://github.com/ryanarn/powerabi> but
  isn't trivial to build. refspecs does have a version of this but it is
  from 1994.
* The PPC64 ELFv2 spec
  https://openpower.foundation/specifications/64bitelfabi/ (ELFv1 is
  already on refspecs)
* Various MIPS ABI docs
  https://web.archive.org/web/20180823071624/https://www.linux-mips.org/pub=
/linux/mips/doc/ABI/
* C-SKY ABI https://github.com/c-sky/csky-doc/tree/master
* The 2002 sysz spec could be updated to
  https://ibm.github.io/s390x-abi/lzsabi_s390x.pdf

Would also be nice if https://refspecs.linuxfoundation.org/elf/ and
https://refspecs.linuxfoundation.org/ELF/ could be merged rather than
having case-sensitive links. A root index would be useful too.

Thanks,
Trevor
