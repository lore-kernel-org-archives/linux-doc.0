Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F34235C1E;
	Sun, 16 Nov 2025 11:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763292218; cv=none; b=Cp8euk4nVBQ2CA8XI7mxfyaTfcdjVTVTbFikl9ArvgjC8lOcLakXTls7OcXKxIN5oJZcUAUNxV0lpqWw4OiorBHbNOUy3joRL1QS+AnSuEey6TR3ek/UAoFC2ze0y+b+KQwEJQNUwm120WvVIO9wRkL5QY1Vwm4QWN/orii4FAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763292218; c=relaxed/simple;
	bh=Xw9ZiEBkCgfWddaPJNnu6BCe82LNLa2EUkYF7Deb+UY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mqe+PoRK45k/pTWy9nAyFNwTUmYW6b9wElYmzos4Pr/FL5tnJVB1dSXnykvuCd+93k4aXMY6xudCS4nzu5SQtfazNA9lMOl43EMvlxyLxeRle8vri4y1PZRgzM05Mf1ooqLWpAwqapiz8tJVDzm6zq0A6hldIHHBiDIcu3dt7Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJSfhCCe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJSfhCCe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D966FC2BC86;
	Sun, 16 Nov 2025 11:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763292217;
	bh=Xw9ZiEBkCgfWddaPJNnu6BCe82LNLa2EUkYF7Deb+UY=;
	h=From:To:Cc:Subject:Date:From;
	b=PJSfhCCejKXtBfsHg5R3FdB4jxuwCd5IGxzU8Nt+opj2uFz9v8svEefdFWHozYfWN
	 wye1dLF2dwjQw0Ly8Js+Ynafz/dF1n4XhZTtowFgnfk8Jixn3rn8mKRelBagxFOyR6
	 fe//oXsJVoSzxjv1Am8czaP0xwvveeFzzJZa0vJUXAubz6m/HEp7l9ASkXvZ/xeQgA
	 KTzxf5IQ+zeWY0ptzGVlLYy2W2AkWPHKRxDPwlAiOVjBxazaSuTlSOOL+XHPVi7jaC
	 PridTpApb99WiOUBt5tRFsPubE0oiFxQ3+cLejk5WaKroviD1FMN50iYLG2akfGruL
	 pw7GFVsSK8tOQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vKar1-0000000Ffkb-2ohj;
	Sun, 16 Nov 2025 12:23:35 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 0/2] kernel-doc: add support for documenting vars
Date: Sun, 16 Nov 2025 12:23:29 +0100
Message-ID: <cover.1763291890.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

As suggested and discussed with Randy, this small series add support
for documenting variables using kernel-doc.

The first patch adds support for it.
The second one documents two variables from media. 

While two documented variables are part of kAPI, I'm documenting them
mostly aiming to test the new feature, as those are meant to be used for
debugging messages, so we could live without having them documented.

I'm pretty sure we'll likely need to improve the parser regexes to
catch everything. For instance, I had to add a logic on v3 due to the
choice I did for the vars, which are pointers.

Mauro Carvalho Chehab (2):
  kernel-doc: add support for handling global variables
  docs: media: v4l2-ioctl.h: document two global variables

 include/media/v4l2-ioctl.h      | 15 +++++++++
 scripts/lib/kdoc/kdoc_output.py | 45 ++++++++++++++++++++++++++
 scripts/lib/kdoc/kdoc_parser.py | 56 ++++++++++++++++++++++++++++++++-
 3 files changed, 115 insertions(+), 1 deletion(-)

-- 
2.51.1


