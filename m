Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6861ACED5
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 13:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298520; cv=none; b=kbtaoRQ49FCBqvKwTzHBp/TGzGuoAL71mK5GpXNPVHXigqZcf1lWPb4331QqM2D1uzqtFqyOta2Yg5ZE8v4le3efKkTHkqBC0icUhwvRFapgg5pH9dMbJVki2Gv/qUDW7IMdoz0NMB+2U1GHMfmuRUoGBXW+k0JIAsvZj+uzbfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298520; c=relaxed/simple;
	bh=7nwci2u+IH2SMmQlelunRUWvLZuWXAaGB2sO487v3e8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u81rUeL6v26cgxqbu6oTU2m+X0ua7O3Ee45TWKdqB+HzoShOyHc36F2aDBk12EnUn0ACXTofXxfWZPt0TdHRfRfHgNxmrS/36xdvZQBJPa25/AqKh+rzTT0bhLM7eHYkZUkVILP3aKum6RcQrX+oHq/XktWBsJ3HQ1SI0HVX6mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGt7iyE4; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGt7iyE4"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81e8b1bdf0cso781135b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 05:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770298519; x=1770903319; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGuF+Gd9iYH6P0b+NtAvir3zebICrprEYigd8LlPHKM=;
        b=fGt7iyE4rOzNRaleyDkyaHw/Lml6tEyXiLvqlPLgSOgaGlba++oFSgN9tHXN+XpFiq
         TnMPwE/EIqvL3cOnYwo4pZ8BC7EuUf78Rwce9OTSVyYeFDUoDzyi2cdc35ZA+DvpgOCr
         3cOuNMeqJcgspSvBNj7VHEyvu3ywmdOyLSswCEkg2nybuJXI89Jw6Jc3bQDYKlZ4AamL
         qcYa3wBBGp26edHNqpZ4ApagM//fGv5KX7hN5738iREjQLLrnFvIIVHFcSexyog6k2V8
         IJHc7z6FNzf+GmF1YK5M130XoIj/z7m63HVzqOgxJ3plwsppg7dMaLRSeR5BSMWGwA4E
         KT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770298519; x=1770903319;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGuF+Gd9iYH6P0b+NtAvir3zebICrprEYigd8LlPHKM=;
        b=TWkOhN4ls0JJnuibX/lXT08YVomMbcV24/qmVJtdKFLYI0hLmqj4RM7JqgKlSh1s1w
         RbcYBiG8osQKN/3KJxEIBs81ikla4mxPyZf3C1h657mU8rjHGdJ0ChQOVbl+Ff/HWGyn
         DVZeX22NOMkvpP6NspxOXlSdVH9REwa8kJ1W0mzUga7XiUgatE0Dkw2duttTUBBFq8Hj
         L8kIjN6OZESjyA6s+U3YBLcXMn3Ybc0s1wfnr1t3Jxm4Am8oZ3wRUm4jrlMjHTA/E1jI
         RuI1Z2ODsYTyktLKi8FkhV/QZUQdB8s4VpOkIyeWT3qKTQaiBJwu6BVnMZMddqTZdBAb
         1x0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlT2fzFYD+uCnL0OArn+grm9Nsb5LUBnxNOWsd9WmcRDljX6/R8W/UdEx5hAPLeC5kPhco/vOxy6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnShrF5L06SwSuvS2R/83BwoThmu0VBIy7iDlErQl0cLqfw+fR
	tlTWMiIz5Nq5oeLUFIYkYCGXZ/JRU0NbH1dqMD9FGKx0uw7RmQuevtCf
X-Gm-Gg: AZuq6aLtPVVzh6z0jcsZh+DaRY5ekDhnyc8wHjdL/GkLqivOAA75zwmQbLegan7uu2E
	rbKJfRNKr61bQVtMnZACzICRAgehz3w3hBviczDD0jjgUGSNZaPSgc6O53+qd9X8bZSbb6N3niN
	1+JPkLvgQ/mu0OInxlXn6hCayhyH6QsRkVMsP06w8G3h84Xk47gYmbM4lfeMMzNkZmtbcecaziQ
	/6rw+oo/aoo8V6OsakXw29U5bneSO7XpIp7FCM01XefkkIDVs5bgxqJ8P/RJAgfnnaBfdCfrUov
	k0BBeq2rsrcPhRsIsdT0dff6xJ04K9jAIcJ1GVpmrtHwItDD3WPn/45FWYCBgePzkbA3jREMUpD
	OmMe01TzcWy67SEhCT+7TEQtM13wT+f0wqTfcp8FmqZU2O9Ik1LFhtetsTsNfVBSIlVcMFY3jnp
	IPEqWrgUw=
X-Received: by 2002:a05:6a21:6194:b0:38d:e6f8:fd97 with SMTP id adf61e73a8af0-393725ddc5amr5941011637.76.1770298519160;
        Thu, 05 Feb 2026 05:35:19 -0800 (PST)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933850f41sm57760505ad.7.2026.02.05.05.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 05:35:18 -0800 (PST)
From: Colin Huang <u8813345@gmail.com>
Subject: [PATCH 0/3] Add support for Delta Q54SN120A1 and Q54SW120A7
Date: Thu, 05 Feb 2026 21:34:34 +0800
Message-Id: <20260205-add-q54sn120a1-q54q54sw120a7-v1-0-09061ecacfc7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGqchGkC/x3MTQqEMAxA4atI1hbS4A96FXERp+mYTdUWVBDvP
 u3s3rd5DySJKgnG6oEopybdQoatK/isHL5i1GUDIXVI2Bp2zhxtk4IlZFuy6CrqjedmoKUTxt5
 DXuxRvN7//TS/7w/mFfpBbgAAAA==
X-Change-ID: 20260205-add-q54sn120a1-q54q54sw120a7-fa492b6ea07f
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Colin.Huang2@amd.com, 
 Carl.Lee@amd.com, Peter.Shen@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770298516; l=1082;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=7nwci2u+IH2SMmQlelunRUWvLZuWXAaGB2sO487v3e8=;
 b=cGbfvPvhCiFhXRfQYxNUQyPQsB6zNtB6NPDRy8x2bQ+kjeZ3X2rCzr7McXlxhOltee2F4No6X
 oVwLiD//TrUB8COwWAwyVskAcgmHy5lyWrZPuaynyFxvNaDy8w9vbOR
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=

This patch series adds support for the Delta Q54SN120A1 and Q54SW120A7
1/4-brick DC/DC power modules with PMBus capability.

Patch 1 adds driver support under hwmon pmbus.
Patch 2 updates the devicetree trivial-devices list.
Patch 3 updates the hwmon documentation index.

These changes have been tested with both modules on hardware platforms
supporting PMBus over I2C.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Colin Huang (3):
      hwmon: (pmbus) Add Delta Q54SN120A1 Q54SW120A7 driver
      dt-bindings: trivial-devices: Add Delta Q54SN120A1 and Q54SW120A7
      docs: hwmon: Add Q54SN120A1 and Q54SW120A7 to index

 .../devicetree/bindings/trivial-devices.yaml       |  4 ++
 Documentation/hwmon/index.rst                      |  2 +
 drivers/hwmon/pmbus/q54sj108a2.c                   | 47 ++++++++++++++++++++--
 3 files changed, 49 insertions(+), 4 deletions(-)
---
base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
change-id: 20260205-add-q54sn120a1-q54q54sw120a7-fa492b6ea07f

Best regards,
-- 
Colin Huang <u8813345@gmail.com>

