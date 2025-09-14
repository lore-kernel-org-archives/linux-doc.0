Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCA71E5B9E
	for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 11:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757850424; cv=none; b=Y7Pc2QMH3u11CePCRZE92yhXg/S7PkOCTosMLU7F+SjjyJuG3752s4WcG+ydQ1NYSTyIveBMBe9QhmMsa0lMtCDyPngpxVhWQ+bvhvGZ5yrg2//NRKR/Yw2FM8GulE9T2VihIUFY0NlqO92XPO6o45rLYHOa2jRFkfznS28+o4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757850424; c=relaxed/simple;
	bh=Vef0/SLB/3XQ2NzY+zZJs5h/v3G/VnhCfqspMhV69LA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CseCd5b57DCs+7WkcVpfSIc3QsWJ6xDoLW1ZLsR4InRFe+1OLFml7vKHEWYv9q+7GraImONnBGuHw6HJYXuYcoMCLh9VNezn6iCz+F2J1dcqLibg14qFXssrMSsYCv94aiOSXSgI4jzBelupigbggxXsEs+7Fs+vbR6ruvjNg8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agcatVAn; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agcatVAn"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6228de280ccso6628614a12.3
        for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 04:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757850419; x=1758455219; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KAoKXGVHOziQYjyeD7oskha56VrVUi66sfNUrJXD8k4=;
        b=agcatVAnr2DMQj9ExoTdHZbf/bBzH9UBWAOJ7x/4V5+1zwD0Ia8zoqJuhOnT36ZYbB
         u/ZFr5ZRVUuAO1kNP6hZieta9VILbjcfd2glbwjUXo2PMsimLFf4go7kr00rE5lR5Px8
         MOfdpnKonhmUtOJyDutcI+SukyOYQP3dUqSgE58fFRPCZXjlaDRM5jVfIQtRJIRngFNO
         KynzczucKuy9ptszw0Z7ZLC9uSMThPHa8uDqrqb8STTP8mbXuBkRKV2rN1KWa2XqCkdy
         dTroP4BZV0wT6l5IPlLwdS+wQ7UDJ5RMSvKUvNgrXZJ8h5Goq2hY77vWN5SW/HzDIxhM
         5mww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757850419; x=1758455219;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KAoKXGVHOziQYjyeD7oskha56VrVUi66sfNUrJXD8k4=;
        b=cFABM4HLmjrOS/chx2FJYBBuZnRugPpED4TMptFTPn4ntzH1GjwvR9YolbtZHSImyT
         Zpd/Zm6+DE+pIM8UN5HE3sBxGlb8Q0EgmYCzaBmHCQAoBvP0RbgowVj8Qa8t3vGeuPP8
         gMt59thewyuff3MaAxffjuXBAX0S5d3vp6XH/W+HQNMcDNsF1ks4iL+WSB/Lx4HR0z1+
         feR0wqE4yuSftR1phdk+CEGKZVwZSA8HkL0MKpH1y7UG3lI3sQsjMLne5XUBRYcPjMPo
         3bSt4Ju3O2bp2xN+iw+emPlYMjccLmnxgL7vJiI4fdEpb4nOj5e8m7dH5rSRHZdMiDSR
         1AcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG/hCxasvKD8x++dUX2aZtIjFv5BjAzxGQ/+g212eedqQjGmgRHrnfKdaBgRrrXIGXHw+V8h2O33E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzK6ST54BuJ3brAYiqINzKEvR5cN1rEhiMw1fLdNCEOf3sP+MN
	CNdHQ4NqHMBMvYrUKy/mMqpBRaZbxCJeB/6vE4FPlte0URdaIC0g5xLlkwAi7ILUCL44y/vD8oA
	UH54TBT2nbgSkJwoOraJkZOAvFTXI400=
X-Gm-Gg: ASbGncss4bbK9WCS5n4LLiUrrv1vm4L8GxtAXVQ8OXYGTIwYIwL01ZQf6JXALaaTay7
	h+bzRRUvYPPaYjE0lRBSkCA6cHy9QIqmf7+iGyVCuwEH3z0YRJjxa5rgJIjuDJOKIpijfk6B9jU
	7vSXN6I+BbqjiUbIHIY239hnr8AKBJTowtW6iej9df8cSCsns5XdYSIvpbplaqadGxECUVY+YRG
	3tOE4sdHp4TKqIb7tD3kjcQ/RkV7cSir32o4co=
X-Google-Smtp-Source: AGHT+IEpP10MNOWGMBt561kTp0QfX0VTRENIU/XkgHJ2PqAPJHdz1SU6ZSejVF2bFKE2L2lOOhFcEwhrYwvbZwVpnCQ=
X-Received: by 2002:a05:6402:5109:b0:62f:166e:5ba6 with SMTP id
 4fb4d7f45d1cf-62f166e68famr3236093a12.37.1757850419147; Sun, 14 Sep 2025
 04:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Taimoor Zaeem <taimoorzaeem@gmail.com>
Date: Sun, 14 Sep 2025 16:46:46 +0500
X-Gm-Features: AS18NWA5EjUc-m50yG81LE_OKBwsLECpU_sy617z6OLKwThiYyPJI1q_OVGHz8o
Message-ID: <CANQcFN1s_iM8p5tYNz3Q_WyZki6Aw9_3HyoKwyoCVA9JeqG0eA@mail.gmail.com>
Subject: [PATCH] Documentation: staging: fix spelling error in remoteproc.rst
To: andersson@kernel.org, "corbet@lwn.net" <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000cd7344063ec17161"

--000000000000cd7344063ec17161
Content-Type: multipart/alternative; boundary="000000000000cd7342063ec1715f"

--000000000000cd7342063ec1715f
Content-Type: text/plain; charset="UTF-8"



--000000000000cd7342063ec1715f
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br></div>

--000000000000cd7342063ec1715f--
--000000000000cd7344063ec17161
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-Documentation-staging-fix-spelling-error-in-remotepr.patch"
Content-Disposition: attachment; 
	filename="0001-Documentation-staging-fix-spelling-error-in-remotepr.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mfjmmnlu0>
X-Attachment-Id: f_mfjmmnlu0

RnJvbSAxMDMyMWM3NWY4ZmMxMjk2Nzc1OTQyZjEzY2IzYWY3OGZkYzhkY2M4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUYWltb29yIFphZWVtIDx0YWltb29yemFlZW1AZ21haWwuY29t
PgpEYXRlOiBTdW4sIDE0IFNlcCAyMDI1IDE2OjMxOjU2ICswNTAwClN1YmplY3Q6IFtQQVRDSF0g
RG9jdW1lbnRhdGlvbjogc3RhZ2luZzogZml4IHNwZWxsaW5nIGVycm9yIGluIHJlbW90ZXByb2Mu
cnN0CgpGaXggdHlwbyAnaW1wbGVtZW50b3JzJyB0byAnaW1wbGVtZW50ZXJzJyBpbiByZW1vdGUg
cHJvY2Vzc29yIGZyYW1ld29yawpkb2N1bWVudGF0aW9uLgoKU2lnbmVkLW9mZi1ieTogVGFpbW9v
ciBaYWVlbSA8dGFpbW9vcnphZWVtQGdtYWlsLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL3N0YWdp
bmcvcmVtb3RlcHJvYy5yc3QgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3N0YWdpbmcvcmVtb3Rl
cHJvYy5yc3QgYi9Eb2N1bWVudGF0aW9uL3N0YWdpbmcvcmVtb3RlcHJvYy5yc3QKaW5kZXggMzQ4
ZWU3ZTUwOGFjLi41YzIyNmZhMDc2ZDYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vc3RhZ2lu
Zy9yZW1vdGVwcm9jLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL3N0YWdpbmcvcmVtb3RlcHJvYy5y
c3QKQEAgLTEwNCw3ICsxMDQsNyBAQCBUeXBpY2FsIHVzYWdlCiAJcnByb2Nfc2h1dGRvd24obXlf
cnByb2MpOwogICB9CiAKLUFQSSBmb3IgaW1wbGVtZW50b3JzCitBUEkgZm9yIGltcGxlbWVudGVy
cwogPT09PT09PT09PT09PT09PT09PT0KIAogOjoKLS0gCjIuNTEuMAoK
--000000000000cd7344063ec17161--
