Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33C813AD1C
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 00:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757465639; cv=none; b=H7GjG0Lq/uGi5IwKBz5AGaE8gU0s94XBeUSe8GoaVmTmkuy6OtXECr74Y22Nm7wLtP8p0C+tPiTrRUXTz8Y6T6lGjFhRLfQbkTuL8wou2FIZZsh24iIGFRocjVPN7py1215hws+csyzkfmBpFLDuG6FVlRlhi6PFEzCy9EdlJ6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757465639; c=relaxed/simple;
	bh=tudW+T0dmyKp8YIE4NUhg+9r3OZ/rus55e7UFnsKP78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhdJWRW3u06xRgYB7at08fDdz6j3mEbiiKyksd1N9JAR1zM/rLS1lZ82mscr7bIFJH3xw2wqBwKc9/QhyNzsVK/nJSaqkHhc7bjX8BJZQYqEh2AVZXs9/FMkLkm1P9tC2LNGNeGX0TAG+jG1KHR8CbgglqCc+5/11b8GwTx1zWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awtvV3h0; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awtvV3h0"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7728815e639so3404816b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Sep 2025 17:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757465637; x=1758070437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cQyP0GZJc1hFrxmU66hajulLthQQnuqIFSCA90Eid9s=;
        b=awtvV3h0LtcJeL1W/QmVp3D5gB7//9/sev0DORxmI9FjpBBhcY7oy76Itg+rnD64ja
         yim0DuM6YDUIvQDMSRz2btIbjIWt2pKlDEI0WW/EtXA1IXbC2SOBC9sC6oABHYJfkg67
         VnAHzD9481on6uf8w+h70jWRif/HRnIVHY2YXj3GAgq2FpD6VRu7kg20bc32J1cK3eZ1
         2cTqmXCf7xT93ikVdeXF2ZsxN2V2EiPeObrZcO+wm447V0xeF3Neing7ksCRLNCXYm96
         2QsbqqtZhH1Ij3RdAkFnwulXk7mU4Cu4TFqSzlBVFt9QOLp8RhKcM5pWMCYkT+v1XjhD
         rXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757465637; x=1758070437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQyP0GZJc1hFrxmU66hajulLthQQnuqIFSCA90Eid9s=;
        b=UE15mzvRzJCfn5+mnLthvi/1kiWxC3NeBC+h5L8TlyGoGVYhVpwvhsYNRXfPIdtJ/f
         cNXJMmqO4lXGH0UoGVbvQZJJ+2tmBNZwSdYIDiEglg028O4mXR3KzI6qsSsf40sd+U7k
         uLWLTcjq5uNlUYeFRlKQmGMhpD2lW07JmLU1DIkffgZ/fI/+26+l4hRilaA83E+Co4Yk
         JxoV3wwFtVdNB7fZsmPVVroAFPGuIddh5C+ceAh+lpuP3iSMed7G8uSEweWqzFZ+IY+I
         tKOAAU32BI+L1dGUf7sKH4A9yejRNJ/upCZsZHspD+HffXrAlypdzpWmI4RhVC8erCcS
         BapQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXCB15wcEJwGgparXWK3lP5tzt2OKV4ZhUiKEXPURuqVimmlwJPMDkpa/l7/aOZNccKofFszLljfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyItyjIoptWTNX64SvB2wcu/dxPkCnFxjgnOfJAh4j/bjkJAmpe
	fW1Re/dfhmqP+vvvL544HVqZI+fYzgR4Aa15TFSReE1ncLFK6Gsf2JSx
X-Gm-Gg: ASbGncux5QDDGwrH91gq3mUty2P+S1/R6h9OlV0XXBXSk7tWjHg6DrlDubgo0mpxiw1
	hwR4MOoj3JnN+j4phfQDqy5KsCq1Q81Q2vok6WW7icAxT1p3dydFNtQYtykWGEG7mDlKh/BBsNa
	G9pQV3x33MKEgIVNI3Tzzg4FZ05ffYiGPhEdwrqt56d1/FXFnPtvSE1u24ylmhVhkOYHJ3kKxIY
	KS+2qz3iBk8rTSDwW/OQ+Ug82YaBY4dy1l4KRZKNGC4wHWOs0iHQyulsKsBojUtCuW07BnhZhFx
	PBb/I/SwIryT7ZUEvb+fmpdNpDbFn8FLC6sqM+j5bTJmdDiUUnn2U82MXyNfWTgkt8wUspNdhdy
	LjIJvTnjMOMkINww0byFrO84kQUkg4/yoUm2n
X-Google-Smtp-Source: AGHT+IHAZHC7oAM8pJIFcJFqO6POsM5S1IybN/l0HMvF9MBkuhQT84W6uIqRsAsMv6iq7YsoCXx+4A==
X-Received: by 2002:a05:6a00:2ea8:b0:772:2fad:ff64 with SMTP id d2e1a72fcca58-7742dce028fmr18864649b3a.8.1757465636796;
        Tue, 09 Sep 2025 17:53:56 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662fea7fsm3210232b3a.103.2025.09.09.17.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 17:53:55 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id E65E0420A809; Wed, 10 Sep 2025 07:53:51 +0700 (WIB)
Date: Wed, 10 Sep 2025 07:53:51 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Andrey Ryabinin <arbn@yandex-team.com>, linux-kernel@vger.kernel.org
Cc: Alexander Graf <graf@amazon.com>, Mike Rapoport <rppt@kernel.org>,
	James Gowans <jgowans@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Baoquan He <bhe@redhat.com>,
	kexec@lists.infradead.org, Pratyush Yadav <ptyadav@amazon.de>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	David Rientjes <rientjes@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Changyuan Lyu <changyuanl@google.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Chris Li <chrisl@kernel.org>, Ashish.Kalra@amd.com,
	William Tu <witu@nvidia.com>, David Matlack <dmatlack@google.com>
Subject: Re: [PATCH v3 7/7] Documentation, kstate: Add KSTATE documentation
Message-ID: <aMDMHx1spjeETKK4@archie.me>
References: <20250909201446.13138-1-arbn@yandex-team.com>
 <20250909201446.13138-8-arbn@yandex-team.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250909201446.13138-8-arbn@yandex-team.com>

On Tue, Sep 09, 2025 at 10:14:42PM +0200, Andrey Ryabinin wrote:
> +There are _V forms of many KSTATE_ macros to load fields for version dependent fields, e.g.

Escape the trailing underscore (i.e. KSTATE\_).

> +Addition of new field can be done as version dependent field by using _V form of
> +KSTATE_ macro:

Ditto.

> +Subsections
> +-----------
> +Another option is adding subsection to kstate_description. A subsection is
> +additional kstate_description which linked to the main one:
> +
> +struct kstate_description test_state_v2 = {
> +	.name = "test_v2",
> +	.id = KSTATE_TEST_ID_V2,
> +	.fields = (const struct kstate_field[]) {
> +		KSTATE_BASE_TYPE(i, struct kstate_test_data, int),
> +		KSTATE_END_OF_LIST()
> +	},
> +};
> +
> +struct kstate_description test_state = {
> +	......
> +	.subsections = (const struct kstate_description *[]){
> +		&test_state_v2,
> +		NULL
> +	},
> +};

Sphinx errors out on struct snippets like above:

Documentation/core-api/kstate.rst:17: WARNING: Inline emphasis start-string without end-string. [docutils]
Documentation/core-api/kstate.rst:17: WARNING: Inline emphasis start-string without end-string. [docutils]
Documentation/core-api/kstate.rst:21: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
Documentation/core-api/kstate.rst:28: ERROR: Unexpected indentation. [docutils]
Documentation/core-api/kstate.rst:32: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
Documentation/core-api/kstate.rst:33: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
Documentation/core-api/kstate.rst:84: ERROR: Unexpected indentation. [docutils]
Documentation/core-api/kstate.rst:100: ERROR: Unexpected indentation. [docutils]
Documentation/core-api/kstate.rst:102: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
Documentation/core-api/kstate.rst:103: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
Documentation/core-api/kstate.rst:106: CRITICAL: Unexpected section title or transition.

...... [docutils]

reStructuredText markup error!

I have to wrap them in literal code blocks:

---- >8 ----
diff --git a/Documentation/core-api/kstate.rst b/Documentation/core-api/kstate.rst
index 981ba162109c34..620d7c126c2038 100644
--- a/Documentation/core-api/kstate.rst
+++ b/Documentation/core-api/kstate.rst
@@ -11,16 +11,16 @@ kstate_description
 ------------------
 
 Most kernel's state is in structs and structs could be described by
-kstate_description. E.g.
+kstate_description. E.g.::
 
-struct kstate_test_data {
+  struct kstate_test_data {
 	int i;
 	unsigned long *p_ulong;
 	char s[10];
 	struct folio *folio;
-};
+  };
 
-struct kstate_description test_state = {
+  struct kstate_description test_state = {
 	.name = "test",
 	.version_id = 1,
 	.id = KSTATE_TEST_ID,
@@ -30,7 +30,7 @@ struct kstate_description test_state = {
 		KSTATE_FOLIO(folio, struct kstate_test_data),
 		KSTATE_END_OF_LIST()
 	},
-};
+  };
 
 Changing data structures
 ------------------------
@@ -55,7 +55,7 @@ There are two version fields:
 
 KSTATE is able to read versions from minimum_version_id to version_id.
 
-There are _V forms of many KSTATE_ macros to load fields for version dependent fields, e.g.
+There are _V forms of many KSTATE_ macros to load fields for version dependent fields, e.g.::
 
 	KSTATE_BASE_TYPE_V(i, struct kstate_test_data, int, 2),
 
@@ -67,7 +67,7 @@ be loaded by any older kernel.
 Removing field
 --------------
 If field is no longer needed it could be marked deprecated using
-KSTATE_*_DEPRECATED macro and bumping ->version_id of kstate_description:
+KSTATE_*_DEPRECATED macro and bumping ->version_id of kstate_description::
 
 	KSTATE_BASE_TYPE_DEPRECATED(k, u16, 1),
 
@@ -80,7 +80,8 @@ Adding new field
 ----------------
 
 Addition of new field can be done as version dependent field by using _V form of
-KSTATE_ macro:
+KSTATE_ macro::
+
 	KSTATE_BASE_TYPE_V(i, struct kstate_test_data, int, 2),
 
 This indicates that 'test_state' only from version 2 and above have field '->i'.
@@ -91,24 +92,24 @@ understand the new V2 'test_state'.
 Subsections
 -----------
 Another option is adding subsection to kstate_description. A subsection is
-additional kstate_description which linked to the main one:
+additional kstate_description which linked to the main one::
 
-struct kstate_description test_state_v2 = {
+  struct kstate_description test_state_v2 = {
 	.name = "test_v2",
 	.id = KSTATE_TEST_ID_V2,
 	.fields = (const struct kstate_field[]) {
 		KSTATE_BASE_TYPE(i, struct kstate_test_data, int),
 		KSTATE_END_OF_LIST()
 	},
-};
+  };
 
-struct kstate_description test_state = {
+  struct kstate_description test_state = {
 	......
 	.subsections = (const struct kstate_description *[]){
 		&test_state_v2,
 		NULL
 	},
-};
+  };
 
 
 Subsection must have a unique ->id. If the receiving side finds a subsection

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
