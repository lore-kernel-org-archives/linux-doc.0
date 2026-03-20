Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1303612D5;
	Fri, 20 Mar 2026 09:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000006; cv=none; b=KDsly9dBQSWROkvSiLvUGRPwl3X0AXA7Jf8Pc0ng2GPLIMNd6CWtqLYUzMfvyqzSrsupA8O2NBk+1UZNll4x11IXq+3Fc9wKa4HEfRp6nQQ0GveDA41dXea4tvoUCIGG+7PgbDiEehzABiAB061QVnBK2wuAN8c8wgKXmHrq2M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000006; c=relaxed/simple;
	bh=id/+5FUwK/r9ct8wEGezIJo8TSE3/b0kuKkYVTMUuak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gi/2ZNJYh5d9LNLqFzfncLtc8r6OvTtWMSdYr3zUqktp54cyU1DHuBC2W3EYCJd9uu5CYHAVq+xIUp7b+zlxTSuMqbt5gKOXvpfqUXIDD2DDwPOJHYqwzIv4pN93LFOEZob0f8CYL1a3eyJKmSKwcbbnaI8TuMB1ih/WVtvUVn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tvkovupo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tvkovupo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4185C2BCAF;
	Fri, 20 Mar 2026 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774000005;
	bh=id/+5FUwK/r9ct8wEGezIJo8TSE3/b0kuKkYVTMUuak=;
	h=From:To:Cc:Subject:Date:From;
	b=Tvkovuponuqmt3vC4RfJRWeXFUld2XYSWOuapfRu1ey0YNkP5Xc6liNjFcWu9abs3
	 TXwSgFNJ/kRYi24aT7eg2DAo+wVAT8j4iXVykKnChYQJPMZVsuFehWxg4b769VizBe
	 82zbRAyNZ+Ui2f3ZHN7GyOBPmHHXgm65OGIWIt1IBMMRjVtXLB4JvzhliVuhnOelmi
	 bk/g29g2Hff6cFaBO/u6B9DX665DCgsACT+VLQrutaPYF3GEvNdQBhf7yw3Nohma6b
	 nUAddTWG3upiJhybllRZYWTMnQCvzRjKmt8WVPyz3XGdWV10IdyEVjld9FmNejAPmS
	 IC/C780EwhSUA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w3WRH-0000000Cbv5-3OLV;
	Fri, 20 Mar 2026 10:46:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 0/2] kernel-doc: better handle data prototypes
Date: Fri, 20 Mar 2026 10:46:39 +0100
Message-ID: <cover.1773998596.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

Don't merge this series. It is just a heads on about what I'm
working right now.

This is basically a proof of concept, not yet integrated with
kernel-doc. It helps to show that investing on a tokenizer
was a good idea.

I'm still testing the code.

Right now, kernel-doc logic to handle data types is very
complex, and the code is split into dump_<type> functions, which
in turn calls several ancillary routines. The most complex ones
are related to handling struct, with involves converting inner
struct/unions into members of the main struct.

By using this new code, all elements from most data types can
be parsed with a single code.

Please notice that the code was designed to pick a single
declaration, as this is how kdoc_parser will use it.
If you try to parse multiple ones, the output won't be right,
as it will pick the first declaration name and create a single
item with all data declarations on it.

As it is not based on regexes, it can properly handle some
problematic cases, like having:

    {};

and:
    ;;;;;

in the middle of a struct/union.

For enums, if one has values inside the declaration, like:

    enum { FOO, BAR } type;

It picks the right data type. Kernel-doc maps this currently as:
    enum type

My plan is to integrate it at Kernel-doc and see how it goes.
It will likely rise some corner cases, but, once we get it right,
this will likely reduce the size and complexity of kdoc_parser.

If you want to test, you can use:

    ./parse_c.py

to use an example hardcoded on it, or it reads from a fname with:

    $ ./parse_c.py x.h
    CDataItem(decl_type=None, decl_name=None, parameterlist=['u16_data'], parametertypes={'u16_data': 'u16 u16_data[sizeof(u64) / sizeof(u16)]'})
    None None

    parameterlist:
      - u16_data

    parametertypes:
      - u16_data: u16 u16_data[sizeof(u64) / sizeof(u16)]

   (on this example, x.h has just:
    u16 u16_data[sizeof(u64) / sizeof(u16)];
   )

The logic stores decl_type and decl_name when the data is
struct/union/enum. If the data is just a declaration, it fills
only one element at parameterlist and at parametertypes.

Mauro Carvalho Chehab (2):
  docs: kdoc: add a class to parse data items
  HACK: add a parse_c.py file to test CDataParser

 parse_c.py                           |  87 +++++++++++
 tools/lib/python/kdoc/data_parser.py | 211 +++++++++++++++++++++++++++
 2 files changed, 298 insertions(+)
 create mode 100755 parse_c.py
 create mode 100644 tools/lib/python/kdoc/data_parser.py

-- 
2.53.0

