Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0503B1A83F9
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 11:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757589655; cv=none; b=R4rFlIpglk+YN2tjq4PxTiko1be6lhwl8x/bvIJzTf6fXQUXyDGMwQbHnull9/SvipFEH/MLYt0zLlqyOtLozmPx0AfyvR8T6q95cTmfo4mHI96an2C2YoSKy6yPeXi4gbRTPJHJi+ReATNq+X/FtWsAyYiN3wLa44DA2wYn9AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757589655; c=relaxed/simple;
	bh=H8yk+xrqMoi1BmiRtNvzwsuYwehWP27jlscfOOwW9g0=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=CcS8qDitGRKpZKsZA7tD7MuHw0ptRjLIH+3ZgQwvQh3b3l6vJX3vx5jiDi8rF1K+yzvlYMM4HZc+QfCV7sjVYMgub1lGzKMFmaeP8S0E/KU8bZHq7c21yBVos27vsXnOKorfKlqQocn2SHx8Lig3aQKItZEPYl3sTzHep8CgqkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BY5usAHu; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BY5usAHu"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3d44d734cabso537381f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 04:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757589652; x=1758194452; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h2HQS+cQinE0HErUF+RK2/CMrXAUaYTUSDi0hoQyZeM=;
        b=BY5usAHuL0pcxURLrYzKIpLS9bohcNiHdFZGsM/RAQJaGFnRX2PgBX/kQRB5VeygMT
         2/EKGTXw6usiTZnn8ISx8WWdmHJDCXZKnia4D9r+l8uVdSqH0AgtQ3wgFBbpB0zBUCND
         j1D5sUOWavyIDoYKtWUEPeXT8BHs9A0UjnH1XSdlouQxV1JM6+b4BRjv+4XGWE2RWf6h
         Yn7DyUgbZe7ypeUI3lna7zBODaeZW5gBi6qr+YoJ+n5vPnBGNS0M28PHzzTVRjC+CbHg
         pm2S/cL/3LmOy+4tSpPiGtzCEWgZacwHeEJt+kzooMj6SV4eWbQokBeVI0ZIrHFSUYfs
         hgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757589652; x=1758194452;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2HQS+cQinE0HErUF+RK2/CMrXAUaYTUSDi0hoQyZeM=;
        b=ZTIUO2HJEF8Ack4CysQGgSapvgIsRur25rilHmvEyC5QN//3F3t8nGbcTiy7/R0uHD
         WgyG8xdLPLGf67JZC0nOe0EBCXb21OseIQTRj5bQCtE0D6ZfQODETtyO/Yoz7etsS8rl
         BldKDDABf39lEEh1ZdBg+bPcTOC1Nlv3ymOCUon5wbmFcDMQG04j9NKg0YFtcrhT44Ac
         5jdedFHOar0iytDHsdz74N0FEZF76niPW2L3rcJgFMGykNzXeNTOC4lVQ9g+aeUblk6X
         deOaG9ruuA1LryaJzTC7RBAQzplBDFeDryuIqB0y3spYDqCFH1ICMFBLn2cspQH0nL0y
         92XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjeb0Am0YV2SBFvZhUZE3NxDLFuGZZObOiMeziXk011WmpGvZPlGnRPcmCs+H1HJEsr/43nwEz4wM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPxmSAje6pQUS4BBxsDWwVBHEKo+GJS+OGNM023RJPJ92tbLuK
	/is+gPW/TdFMJMrLJx5awRuf046LbLkSRVjHo3z4u7j1F9fn3dXer6qh
X-Gm-Gg: ASbGncsH3aBYupeDQdB5tZXW+8l85LpLyG4jNwbXY/FfKp5+1eESq2OsHcAif/FDhQY
	/1JawuhWHdcgcn+dAEaEHzLAOK+Rwc4IqpdEhvRVDPyH8g7RngKXAn+HRI3H3B3nQAPIqO09Feu
	yR7A2aTPQd7TZ5iIIcCgnlUg3s12O0REjE+cS1u62cilwQLET++b/X+vitWmnkaQ5PzTD6H5xtX
	qn5o72Abd0ijByigfxABg2KnEqAJJCYJx3eIFaOVE27uGrVcH1FjdG0rAn2lq0s3uLl7YcdYD4F
	L1BygTxwByLPRguVaIT1ORGDcg8fjOTpj+3IoEgtIH7NEWw8qxuys1LD5HiI6f8yZdWJ8v5T0wM
	GGg7fI+XjqZ7tBl3JRiYSpbzsBMIU5+FGEAxtegw=
X-Google-Smtp-Source: AGHT+IGo+F4NUZA5jrtFJZ3gols7D7bXthNGq85BXY2ZGDeIz6G8pf+puXsiQ9wTfeZ6/fjO6sDA+Q==
X-Received: by 2002:a5d:64e7:0:b0:3da:e7d7:f1ec with SMTP id ffacd0b85a97d-3e646257889mr15832414f8f.32.1757589651961;
        Thu, 11 Sep 2025 04:20:51 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:18f9:fa9:c12a:ac60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760786ceasm2152003f8f.16.2025.09.11.04.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 04:20:51 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,  Jakub Kicinski <kuba@kernel.org>,
  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Paolo Abeni <pabeni@redhat.com>,  Simon Horman
 <horms@kernel.org>,  linux-doc@vger.kernel.org,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] tools: ynl: rst: display attribute-set doc
In-Reply-To: <20250910-net-next-ynl-attr-doc-rst-v1-1-0bbc77816174@kernel.org>
Date: Thu, 11 Sep 2025 11:44:55 +0100
Message-ID: <m2v7lpuv2w.fsf@gmail.com>
References: <20250910-net-next-ynl-attr-doc-rst-v1-1-0bbc77816174@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Matthieu Baerts (NGI0)" <matttbe@kernel.org> writes:

> Some attribute-set have a documentation (doc:), but it was not displayed
> in the RST / HTML version. Such field can be found in ethtool, netdev,
> tcp_metrics and team YAML files.
>
> Only the 'name' and 'attributes' fields from an 'attribute-set' section
> were parsed. Now the content of the 'doc' field, if available, is added
> as a new paragraph before listing each attribute. This is similar to
> what is done when parsing the 'operations'.

This fix looks good, but exposes the same issue with the team
attribute-set in team.yaml.

The following patch is sufficient to generate output that sphinx doesn't
mangle:

diff --git a/Documentation/netlink/specs/team.yaml b/Documentation/netlink/specs/team.yaml
index cf02d47d12a4..fae40835386c 100644
--- a/Documentation/netlink/specs/team.yaml
+++ b/Documentation/netlink/specs/team.yaml
@@ -25,7 +25,7 @@ definitions:
 attribute-sets:
   -
     name: team
-    doc:
+    doc: |
       The team nested layout of get/set msg looks like
           [TEAM_ATTR_LIST_OPTION]
               [TEAM_ATTR_ITEM_OPTION]

> Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
> ---
> Note: this patch can be applied without conflicts on top of net-next and
> docs-next. To be honest, it is not clear to me who is responsible for
> applying it :)
> ---
>  tools/net/ynl/pyynl/lib/doc_generator.py | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tools/net/ynl/pyynl/lib/doc_generator.py b/tools/net/ynl/pyynl/lib/doc_generator.py
> index 403abf1a2edaac6936d0e9db0623cd3e07aaad8e..3a16b8eb01ca0cf61a5983d3bd6a866e04c75844 100644
> --- a/tools/net/ynl/pyynl/lib/doc_generator.py
> +++ b/tools/net/ynl/pyynl/lib/doc_generator.py
> @@ -289,6 +289,10 @@ class YnlDocGenerator:
>          for entry in entries:
>              lines.append(self.fmt.rst_section(namespace, 'attribute-set',
>                                                entry["name"]))
> +
> +            if "doc" in entry:
> +                lines.append(self.fmt.rst_paragraph(entry["doc"], 0) + "\n")
> +
>              for attr in entry["attributes"]:
>                  if LINE_STR in attr:
>                      lines.append(self.fmt.rst_lineno(attr[LINE_STR]))
>
> ---
> base-commit: deb105f49879dd50d595f7f55207d6e74dec34e6
> change-id: 20250910-net-next-ynl-attr-doc-rst-b61532634245
>
> Best regards,
