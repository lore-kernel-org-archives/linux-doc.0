Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2644238F62C;
	Tue, 24 Mar 2026 15:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774366435; cv=none; b=F1+2ezB2oyPrVLU2GCgMONGfVuAF2ifX+c46rQU+SSoPwweJBm8QXrcOAT6pci3g4eBUGFm9QN5B7OAo7j1Qf2sZbWRq1hObdC0e/ls+G0CkkC3hmARBN3T2kUDH5kXt5Fm+gmOre5YEhHkYZ/SCIL/lVgvZKjEEGQByZbvme4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774366435; c=relaxed/simple;
	bh=zQAqURLKYaYrF3T8jIh4Hb3yeI14k56SXnxJkduGXqI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ut+g83JfmYvtGW1VqRTooIgePzDbtg83DoxJrS2Wn3AlPemwWEU+PQZ81j/ArvpmqQpN///dqoRa7Klizg9GeWF6KZrOAQA9lkxwQpyyPDm0ITiJ9lFHxrdUvoAL1EPmUmqZgc4vBaEQTD4wVo5mHLJVUyt/j+gTiVjWhMZ+MbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwWRw7oX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwWRw7oX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77460C19424;
	Tue, 24 Mar 2026 15:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774366434;
	bh=zQAqURLKYaYrF3T8jIh4Hb3yeI14k56SXnxJkduGXqI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UwWRw7oXISb4SdDCeuMd4OjQ4ENfTMsaSI0ZXUAXTMisJpwBV4jv3WACvm8dsARmV
	 VBK2kM7eAHqvp8B2Ujhtxjbb1a+7EXZmrP+Y9YYIsKWXd6Ji2S8xtJlj1s5pANsDMo
	 GYkuY1A/EBwHspDbdn/KTE+Ws2GnAGTxW2nkxZRQYr64eHrBzjNGRoaGmX3FtPijdj
	 vJuzLfl9udLBQ87H5EsdkePYz30rkFQJKIioPzc78znYv8tOG1KtsQMREjZtzr4J+t
	 98pG6lWlcWGFd187RluFnmtpnxH4Iv6WZKB54aFW+gIjZkB/DyMQA2UBxbomGvmmMX
	 nokvi0J9IuE0w==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w53lP-00000007JGH-2D1I;
	Tue, 24 Mar 2026 16:33:51 +0100
Date: Tue, 24 Mar 2026 16:33:50 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] kernel-doc: better handle data prototypes
Message-ID: <20260324163350.2b75fe3a@localhost>
In-Reply-To: <cover.1773998596.git.mchehab+huawei@kernel.org>
References: <cover.1773998596.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Mar 2026 10:46:39 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Hi Jon,
> 
> Don't merge this series. It is just a heads on about what I'm
> working right now.
> 
> This is basically a proof of concept, not yet integrated with
> kernel-doc. It helps to show that investing on a tokenizer
> was a good idea.
> 
> I'm still testing the code.

Heh, getting it working is hard, but I ended with something that
should work with a somewhat complex scenario.

The new version is at my scratch repository at:

	https://github.com/mchehab/linux PR_CDataParser-v2

I'm expecting that this parser should be able to handle:

	- typedef (for data types);
	- struct
	- union
	- enum
	- var

So, after properly integrated(*), it should simplify a lot the
code inside kdoc_parser.

(*) right now, it is minimally integrated, handling just
    struct/unions.
	
My current plan is to test it more with real-case scenarios,
aiming to submit it after 7.1-rc1, as it sounds to be that a
change like that is too late to be submitted like that.

IMO the newer code should be more reliable than the current
approach and should produce a better output once done.


-- 
Thanks,
Mauro

For this input:

<snip>
/**
 * struct property_entry - property entry
 *
 * @name: name description
 * @length: length description
 * @is_inline: is_inline description
 * @bar: bar description
 * @my_enum: my_enum description
 * @test: test description
 * @anonymous: anon description
 * @type: type description
 * @literal: literal description
 * @pointer: pointer description
 * @value: value description
 * @boou8_data: boou8_data description
 * @u16_data: u16_data description
 * @u32_data: u32_data description
 * @u64_data: u64_data description
 * @str: str description
 * @prop_name: prop name description
 */

struct property_entry {
	const char *name;
	size_t length;
	bool is_inline;   /* TEST */
	struct foo {
		char *bar[12];
		struct {
			enum enum_type my_enum; /* TEST	2 */
			struct {
				uint_t test; /* TEST 3 */
				static const int anonymous;
			};
		} foobar ;
		;;
		{};
	};
	enum dev_prop_type type;

	enum {
		EXPRESSION_LITERAL,
		EXPRESSION_BINARY,
		EXPRESSION_UNARY,
		EXPRESSION_FUNCTION,
		EXPRESSION_ARRAY
	} literal;

	union {
		const void *pointer;
		union {
			u8 boou8_data[sizeof(u64) / sizeof(u8)];
			u16 u16_data[sizeof(u64) / sizeof(u16)];
			u32 u32_data[sizeof(u64) / sizeof(u32)];
			u64 u64_data[sizeof(u64) / sizeof(u64)];
			const char *str[sizeof(u64) / sizeof(char *)];
		};
	};
	char *prop_name;
};
</snip>

Kernel-doc produces a proper result:

<snip>
Ignoring foobar


.. c:struct:: property_entry

  property entry

.. container:: kernelindent

  **Definition**::

    struct property_entry {
        const char *name;
        size_t length;
        bool is_inline;
        struct foo {
            char *bar[12];
            struct {
                enum enum_type my_enum;
                struct {
                    uint_t test;
                    static const int anonymous;
                };
            } foobar;
            {
            };
        };
        enum dev_prop_type type;
        enum {
            EXPRESSION_LITERAL,
            EXPRESSION_BINARY,
            EXPRESSION_UNARY,
            EXPRESSION_FUNCTION,
        EXPRESSION_ARRAY } literal;
        union {
            const void *pointer;
            union {
                u8 boou8_data[sizeof(u64) / sizeof(u8)];
                u16 u16_data[sizeof(u64) / sizeof(u16)];
                u32 u32_data[sizeof(u64) / sizeof(u32)];
                u64 u64_data[sizeof(u64) / sizeof(u64)];
                const char *str[sizeof(u64) / sizeof(char *)];
            };
        };
        char *prop_name;
        }
    };

  **Members**

  ``{unnamed_struct}``
    anonymous

  ``name``
    name description

  ``length``
    length description

  ``is_inline``
    is_inline description

  ``bar``
    bar description

  ``my_enum``
    my_enum description

  ``{unnamed_struct}``
    anonymous

  ``test``
    test description

  ``anonymous``
    anon description

  ``type``
    type description

  ``literal``
    literal description

  ``{unnamed_union}``
    anonymous

  ``pointer``
    pointer description

  ``boou8_data``
    boou8_data description

  ``u16_data``
    u16_data description

  ``u32_data``
    u32_data description

  ``u64_data``
    u64_data description

  ``str``
    str description

  ``prop_name``
    prop name description
</snip>



