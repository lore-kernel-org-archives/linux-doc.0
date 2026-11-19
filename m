Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099677;
	b=30wXT4W5Nt0aZqxvJ27FGlunALB3ep1juODerl75Cx0ZufFez9CI9xkZYPXCtafrU533
	 YonUR8qtavtFtgWIurs+2/Ee2ev7u3tUXAsID6nK12aKZKmBk9MYinMuPTWhmJfNA3ZqZ
	 R6YJJD+aZtSzD2ADZGf76uBWvYxW9nRR1p1EsIwFa3dlcQjvrIEZljwOI4loJweeKwNCq
	 fIMiPzTK4xhQarEG6Cnw6fg8jJZHJmwG7wyS1zcTmbIBnv+KYvwrDn8zGIUGDCwzsW3/y
	 xKIf+lDypEFt5ke9f8jVabf7M4xtw6VOXLKO26n9kYSv5SQ/3wvmL5OGvu1MH7BGKVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099677;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Q7GXtYQNrYbuKdV0Kh+O/FFO/tpzNiLA2pmpmvbStjo=;
	b=funMZPdLt1nw+rj4brYiiT0RUlZrgj1ybBoAKhD15utdZrsOcPPXDAF8D86HHB+hRwqH
	 z0ByqhbNJE1sH8B9e/w5bPBEMtbINCmzdEJEuGhIKQqZfGIb/S5uGMd3tk/xgv5eZa65O
	 GNIj7wL8439Sd5rGNDE3sARPr7TCRqeQl/POK5O9GJ6h66ZfBkZj/yGeOSMZGz2Jie2CI
	 QxA4dGl9zY33KfU5J3PPd9Sjv3ONzcDDzqieJ1LBcLoZNWDdJQYQrCKB867UkC3veROj+
	 +YaeMsZVXmaqOXzQXT+V6thQtYuuadlBvbLvCdR1N2JrlV+GYtvZZYTqfAhhbwW5WWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=hgTLBv82;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23911606A33E
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 14:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23911606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=hgTLBv82
Received: from trampoline.thunk.org (pool-173-48-114-214.bstnma.fios.verizon.net [173.48.114.214])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6AJElgXd018240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:47:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1795099664; bh=Q7GXtYQNrYbuKdV0Kh+O/FFO/tpzNiLA2pmpmvbStjo=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hgTLBv823sTQybbxTwxzBJTE0IZQuICwA3AHO9YbF+uAP6A5Emwpmu/+ON9eEkTDk
	 LEKsIT+T6vZRoB2Vd7nhvRe69MThSjlBbVEZO7OU0avdJrXTxE+1s6HPIs/j/m5i66
	 memXcTaSx7fJfwr0Ent0NqczW/dte3jUpXRwC/OFPm+K0PAgQ2BP+kUNzLsaN7aELJ
	 B1n+tLb7U+M+g/0gvU1LkK6/p1r+5cUzA3a5u6h4bRI+gPimayc4uKnt0blcEqZXhI
	 wVkwOxhs2eGswrOBgplbmpI9W0mK/iMpw70/5S58CU9NVwb8SfGYCDcEc/kc8xODlL
	 ppZ4BSbhF1pfw==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 695412E0198; Thu, 19 Nov 2026 09:47:33 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ext4 Developers List <linux-ext4@vger.kernel.org>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Stephen Kitt <steve@sk2.org>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: ext4 filesystems can be converted to 64-bit
Date: Thu, 19 Nov 2026 09:47:21 -0500
Message-ID: <179509948707.1938961.8287579133944800661.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014162921.450235-1-steve@sk2.org>
References: <20261014162921.450235-1-steve@sk2.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 14 Oct 2026 18:29:20 +0200, Stephen Kitt wrote:
> Since commit fe12931 ("resize2fs: convert fs to and from 64bit mode")
> in e2fsprogs, which shipped in version 1.43, resize2fs can convert
> filesystems from 32-bit to 64-bit and back, so the mention in the
> checksum documentation that this is impossible is obsolete. This fixes
> that.
> 
> 
> [...]

Applied, thanks!

[1/1] docs: ext4 filesystems can be converted to 64-bit
      commit: c9db324f2051c0aa3aea5bd2cec299ae9c9d79e7

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>
